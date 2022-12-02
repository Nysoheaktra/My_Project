import 'package:app_commerce/view/category/category_screen.dart';
import 'package:app_commerce/view/home/home_screen.dart';
import 'package:app_commerce/view/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/dashboard_controller.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              const HomeScreen(),
              const ProductScreen(),
              const CategoryScreen(),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.orange,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 0.5),
            ),
          ),
          child: SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: const EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            snakeViewColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showSelectedLabels: true,
            currentIndex: controller.tabIndex,
            onTap: (val) {
              controller.updateIndex(val);
            },
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    // color: Colors.black,
                  ),
                  label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Category'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.menu), label: 'Menu'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Account'),
            ],
          ),
        ),
      ),
    );
  }
}
