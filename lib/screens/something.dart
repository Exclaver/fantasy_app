import 'package:fantasyapp/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Something extends StatelessWidget {
  const Something({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kuch to daalenge')),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}