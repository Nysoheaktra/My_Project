import 'package:app_commerce/controller/controller.dart';
import 'package:app_commerce/view/account/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSceen extends StatefulWidget {
  const AccountSceen({super.key});

  @override
  State<AccountSceen> createState() => _AccountSceenState();
}

class _AccountSceenState extends State<AccountSceen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/user.png"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      authController.user.value?.fullname ??
                          "Sign in your account",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          buildAccountCard(
            title: "Profile Info",
            onClick: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ));
            },
          ),
          buildAccountCard(
            title: "Notification",
            onClick: () {},
          ),
          buildAccountCard(
            title: "Settings",
            onClick: () {},
          ),
          buildAccountCard(
            title: "About Us",
            onClick: () {},
          ),
          buildAccountCard(
            title: "Term of Service",
            onClick: () {},
          ),
          Obx(
            () => buildAccountCard(
              title: authController.user.value == null ? "Sign In" : "Sign Out",
              onClick: () {
                if (authController.user.value != null) {
                  authController.signOut();
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildAccountCard({required String title, required Function onClick}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 7,
                spreadRadius: 0.1,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Icon(Icons.keyboard_arrow_right_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
