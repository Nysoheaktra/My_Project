// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:app_commerce/controller/controller.dart';
import 'package:app_commerce/extention/string_extention.dart';
import 'package:app_commerce/view/account/auth/sign_in.dart';
import 'package:flutter/material.dart';

import '../../../component/input_outline_button.dart';
import '../../../component/input_text_button.dart';
import '../../../component/input_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fromKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confrimPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  'Created Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign up to started!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.2),
                ),
                const Spacer(
                  flex: 3,
                ),
                InputTextField(
                  title: 'Full Name',
                  textEditingController: fullNameController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be entry";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InputTextField(
                  title: 'Email',
                  textEditingController: emailController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be entry";
                    } else if (!value.isValidEmail) {
                      return "Please enter email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InputTextField(
                  title: 'Password',
                  obsecureText: true,
                  textEditingController: passwordController,
                  validation: (String? value) {
                    List<String> validation = [];
                    if (value == null || value.isEmpty) {
                      return "This field can't be entry";
                    } else {
                      if (!value.isValidPasswordHasNumber) {
                        validation.add("Must contain 1 number");
                      }
                      if (!value.isValidPasswordHasCapitalLetter) {
                        validation.add("Must contain 1 capital letter");
                      }
                      if (!value.isValidPasswordHasLowerCaseLetter) {
                        validation.add("Must contain 1 simple letter");
                      }
                      if (!value.isValidPasswordHasSpecialCharacter) {
                        validation.add(
                            "Must contain 1  special character[# % ! \$ &]");
                      }
                    }
                    String msg = '';
                    if (validation.isNotEmpty) {
                      for (var i = 0; i < validation.length; i++) {
                        msg = msg + validation[i];
                        if ((i + 1) != validation.length) {
                          msg = msg + "\n";
                        }
                      }
                    }

                    return msg.isNotEmpty ? msg : null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InputTextField(
                  title: 'Confirm Password',
                  obsecureText: true,
                  textEditingController: confrimPasswordController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be entry";
                    } else if (confrimPasswordController.text != value) {
                      return "Confirm not match";
                    }
                    return null;
                  },
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
                InputTextButton(
                    title: "Sign Up",
                    onClick: () {
                      if (_fromKey.currentState!.validate()) {
                        authController.signUp(
                            fullname: fullNameController.text,
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    }),
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
                    const Text("I'm already a member"),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: const Text(
                        'Sign in',
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
      ),
    );
  }
}
