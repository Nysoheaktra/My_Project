import 'package:app_commerce/component/input_outline_button.dart';
import 'package:app_commerce/component/input_text_button.dart';
import 'package:app_commerce/component/input_text_field.dart';
import 'package:app_commerce/view/account/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Sign in to continus!",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.2),
              ),
              const Spacer(
                flex: 3,
              ),
              const InputTextField(title: 'Email'),
              const SizedBox(
                height: 10,
              ),
              const InputTextField(
                title: 'Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forgot password',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InputTextButton(title: "Sign In", onClick: () {}),
              const SizedBox(
                height: 10,
              ),
              InputOutlineButton(
                  title: 'back',
                  onClick: () {
                    Navigator.of(context).pop();
                  }),
              const Spacer(
                flex: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I'm new user"),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
