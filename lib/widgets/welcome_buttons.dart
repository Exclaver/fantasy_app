import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton(
      {super.key,
      this.onTap,
      required this.logo,
      this.icon,
      required this.text});

  final Function()? onTap;
  final bool logo;
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 179, 175, 175),
              blurRadius: 25.0,
              offset: Offset(0, 15),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo
                  ? const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                        'assets/images/google.png',
                      ),
                    )
                  : Icon(
                      icon,
                      size: 28,
                    ),
              const SizedBox(
                width: 20,
              ),
              Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 45),
//       child: ElevatedButton.icon(
//         onPressed: onTap,
//         icon: const Image(
//           image: AssetImage('assets/images/google.png'),
//           width: 30,
//           height: 30,
//         ),
//         label: Text(text),
//       ),
//     );

