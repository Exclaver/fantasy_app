import 'package:fantasyapp/widgets/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool passwordVisible = false;

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign-up error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(width * 0.04, height * 0.08, 0, 0),
        child: Align(
          alignment: Alignment.topLeft,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_sharp),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppText(
                    text: 'Get Started',
                    size: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      const AppText(
                        text: 'Already have a account?',
                        color: Colors.grey,
                        size: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const AppText(text: 'Sign In'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    validator: nameValidator,
                    controller: _name,
                    obscureText: false,
                    label: 'Name',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextField(
                    controller: _email,
                    obscureText: false,
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextField(
                    controller: _password,
                    obscureText: passwordVisible,
                    label: 'Password',
                    icon: IconButton(
                      icon: passwordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 34, 7, 79),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        _formKey.currentState!.validate() ? signUp() : null;
                      },
                      child: const AppText(
                        text: 'Sign Up',
                        size: 17,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? nameValidator(String? val) {
  if (val!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(val)) {
    return 'Required';
  } else {
    return null;
  }
}
