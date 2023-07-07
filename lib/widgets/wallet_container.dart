import 'package:fantasyapp/widgets/app_text.dart';
import 'package:flutter/material.dart';

class WalletContainer extends StatelessWidget {
  const WalletContainer({super.key, required this.amount});
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(104, 61, 58, 58),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              color: Colors.white,
              Icons.account_balance_wallet_outlined,
              weight: 80,
            ),
            AppText(
              text: '₹$amount',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              size: 17,
            ),
            const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 13,
              child: Icon(
                color: Colors.white,
                Icons.add,
                size: 20,
                weight: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
