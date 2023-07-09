import 'package:fantasyapp/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      bottomNavigationBar: const BottomNavBar(),
    );
  
  }
}
