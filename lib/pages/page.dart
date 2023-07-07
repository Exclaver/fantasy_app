import 'package:fantasyapp/screens/home.dart';
import 'package:fantasyapp/auth/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckForSignIn extends StatelessWidget {
  const CheckForSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const SignIn();
            }
          }),
    );
  }
}

  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: _emailcontroller.text.trim(),
  //     password: _passwordcontroller.text.trim(),
  //   );
  // }

  // @override
  // void dispose() {
  //   _emailcontroller.dispose();
  //   _passwordcontroller.dispose();
  //   super.dispose();
  // }