import 'package:fantasyapp/screens/something.dart';

import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'my_matches.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentScreen = 0;
  final List<Widget> screens = [
    HomeScreen(),
    MyMatches(),
    Something(),
    ProfilePage(),
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.my_library_add,
    Icons.chat,
    Icons.person,
  ];

  List<String> labels = [
    'Home',
    'My Matches',
    'Chat',
    'Account',
  ];

  void onTap(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: currentScreen,
        onTap: onTap,
        items: List.generate(icons.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              icons[index],
            ),
            label: labels[index],
          );
        }),
      ),
    );
  }
}
