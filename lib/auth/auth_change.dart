import 'package:fantasyapp/screens/home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/sign_in.dart';

class CheckForSignIn extends StatelessWidget {
  const CheckForSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  HomeScreen();
          } else {
            return const SignIn();
          }
        });
  }
}