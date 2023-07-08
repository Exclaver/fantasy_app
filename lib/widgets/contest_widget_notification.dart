import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fantasyapp/widgets/app_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ContestWidgetNotif extends StatefulWidget {
  final String prizepool;
  final ImageProvider<Object> image;
  final String entryfees;
  final String category;

  const ContestWidgetNotif({
    Key? key,
    required this.image,
    required this.prizepool,
    required this.entryfees,
    required this.category,
  }) : super(key: key);

  @override
  State<ContestWidgetNotif> createState() => _ConstestWidgetState();
}

class _ConstestWidgetState extends State<ContestWidgetNotif> {
  bool _timerRunning = false;
  int _totalSeconds = 60; // Set timer

  Timer? _timer;
  SharedPreferences? _preferences;
  FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    initializePreferences();
    initializeNotifications();
  }

  void initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _totalSeconds = _preferences!.getInt('timerDuration') ?? 0;
    });
  }

  void initializeNotifications() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    _flutterLocalNotificationsPlugin!.initialize(initializationSettings,
        onDidReceiveNotificationResponse: null);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startCountdownTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_totalSeconds > 0) {
          _totalSeconds--;
          _preferences!.setInt('timerDuration', _totalSeconds);
        } else {
          _timerRunning = false;
          stopCountdownTimer();
        }
      });
    });
  }

  void stopCountdownTimer() {
    _timer?.cancel();
    _preferences!.remove('timerDuration');
    _flutterLocalNotificationsPlugin!.cancel(0);
  }

  Future<void> scheduleNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin!.show(
      0,
      'Countdown Timer',
      'Timer has finished',
      platformChannelSpecifics,
      payload: 'timer_complete',
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
      child: Container(
        height: 150,
        width: width * 0.95,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: width * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.image,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _timerRunning = !_timerRunning;
                        if (_timerRunning) {
                          if (_totalSeconds > 0) {
                            startCountdownTimer();
                            scheduleNotification();
                          }
                        } else {
                          stopCountdownTimer();
                        }
                      });
                    },
                    child: const AppText(
                      text: 'Starts In',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppText(text: formatDuration(_totalSeconds)),
                  const SizedBox(
                    height: 5,
                  ),
                  const AppText(
                    text: 'Prize Pool',
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(text: '${widget.prizepool}k'),
                  const SizedBox(
                    height: 5,
                  ),
                  const AppText(
                    text: 'Entry Fee',
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(text: widget.entryfees),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDuration(int totalSeconds) {
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds ~/ 60) % 60;
    int hours = (totalSeconds ~/ 3600) % 24;

    return '$hours hr $minutes min $seconds sec';
  }
}
