import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyapp/screens/sign_in.dart';
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
  final TextEditingController _phoneNo = TextEditingController();

  bool passwordVisible = false;

  String selectedGender = '';

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
    createUserProfile(
      _name.text.trim(),
      _email.text.trim(),
      _phoneNo.text.trim(),
    );
  }

  Future createUserProfile(String name, String email, String phoneNo) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'phone_no': phoneNo,
      'email': email,
    });
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
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
                    height: 25,
                  ),
                  // Row(
                  //   children: [
                  //     Radio<String>(
                  //       value: 'Male',
                  //       groupValue: selectedGender,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           selectedGender = value!;
                  //         });
                  //       },
                  //     ),
                  //     const AppText(text: 'Male', size: 17),
                  //     const SizedBox(width: 30),
                  //     Radio<String>(
                  //       value: 'Female',
                  //       groupValue: selectedGender,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           selectedGender = value!;
                  //         });
                  //       },
                  //     ),
                  //     const AppText(text: 'Female', size: 17),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    controller: _phoneNo,
                    keyboardType: TextInputType.phone,
                    validator: phoneNumberValidator,
                    obscureText: false,
                    label: 'Phone Number',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AppTextField(
                    controller: _email,
                    obscureText: false,
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 25,
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

String? phoneNumberValidator(String? value) {
  if (value!.isEmpty) {
    return 'Phone number is required';
  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return 'Invalid phone number';
  } else {
    return null;
  }
}
