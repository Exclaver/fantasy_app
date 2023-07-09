import 'package:flutter/material.dart';
import 'package:fantasyapp/screens/something.dart';

import '../screens/home_screen.dart';
import '../screens/my_matches.dart';
import '../screens/profile_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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

  void onTabTapped(int index) {
    setState(() {
      currentScreen = index;
    });

    printfunc();
  }

  printfunc() {
    print(currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      currentIndex: currentScreen,
     onTap: onTabTapped,
      items: List.generate(icons.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(
            icons[index],
          ),
          label: labels[index],
        );
      }),
    );
  }
}
