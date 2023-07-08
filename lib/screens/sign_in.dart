import 'package:fantasyapp/screens/home_screen.dart';
import 'package:fantasyapp/screens/sign_up.dart';
import 'package:fantasyapp/auth/services/google_auth_service.dart';
import 'package:fantasyapp/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/text_field.dart';
import '../widgets/welcome_buttons.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool passwordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isSignedIn = false;

  Future<void> signIn() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
      print('Sign-in successful');
      print('User ID: ${userCredential.user?.uid}');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign-in error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.25, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppText(
                text: 'Login',
                size: 30,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: _emailcontroller,
                obscureText: false,
                label: 'Email',
              ),
              const SizedBox(
                height: 15,
              ),
              AppTextField(
                controller: _passwordcontroller,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ],
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
                  onPressed: signIn,
                  child: const AppText(
                    text: 'Sign In',
                    size: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText(
                    text: "Don't have a account?",
                    color: Colors.grey,
                    size: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    child: const AppText(text: 'Sign Up'),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.9,
                      color: Colors.grey[400],
                    ),
                  ),
                  const Text('Or continue with '),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              WelcomeButton(
                onTap: () => AuthService().signInWithGoogle(),
                logo: true,
                text: 'Sign In with Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
