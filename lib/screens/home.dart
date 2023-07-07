import 'package:fantasyapp/widgets/category_container.dart';
import 'package:fantasyapp/widgets/wallet_container.dart';
import 'package:flutter/material.dart';

import '../widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    'All',
    'Finance',
    'Gaming',
    'Technology',
    'Business',
    'Science',
    'Fitness',
    'Politics'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 176, 144, 229),
          title: const AppText(
            text: 'CONTESTS',
            fontWeight: FontWeight.bold,
          ),
          actions: const [WalletContainer(amount: 12)],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: ((context, index) {
                  return CategoryContainer(
                    text: categories[index],
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    isSelected: selectedIndex == index,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
