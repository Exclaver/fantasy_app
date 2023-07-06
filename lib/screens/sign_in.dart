import 'package:fantasyapp/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../widgets/text_field.dart';
import '../widgets/welcome_buttons.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool passwordVisible = false;

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
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.29, left: 20, right: 20),
        child: Form(
          key: _formKey,
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
                validator: emailValidator,
                controller: email,
                obscureText: false,
                label: 'Email',
              ),
              const SizedBox(
                height: 15,
              ),
              AppTextField(
                validator: passwordValidator,
                controller: password,
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
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: const AppText(
                    text: 'Sign Up',
                    size: 17,
                    color: Colors.white,
                  ),
                ),
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
                height: 70,
              ),
              WelcomeButton(
                onTap: () {},
                logo: true,
                text: 'Sign up with Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? emailValidator(String? val) {
  if (val!.isEmpty) {
    return 'Required';
  } else if (!val.contains('@')) {
    return 'Enter valid email address';
  } else {
    return null;
  }
}

String? passwordValidator(String? val) {
  if (val!.isEmpty) {
    return 'Required';
  } else {
    return null;
  }
}
