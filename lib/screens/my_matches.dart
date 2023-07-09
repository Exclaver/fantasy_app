import 'package:fantasyapp/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MyMatches extends StatelessWidget {
  const MyMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My matches'),),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}