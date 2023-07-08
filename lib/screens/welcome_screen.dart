import 'package:fantasyapp/screens/sign_in.dart';
import 'package:fantasyapp/screens/sign_up.dart';

import 'package:fantasyapp/widgets/welcome_buttons.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              const Center(
                child: Text(
                  'Welcome to Fantasy App',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: height * 0.2,
              ),
              WelcomeButton(
                onTap: () {},
                logo: true,
                text: 'Sign up with Google',
              ),
              const SizedBox(
                height: 20,
              ),
              WelcomeButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const SignUp()),
                    ),
                  );
                },
                logo: false,
                text: 'Sign up with Email',
                icon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              // WelcomeButton(
              //   onTap: () {},
              //   logo: false,
              //   text: 'Sign in with Phone',
              //   icon: Icons.phone,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
