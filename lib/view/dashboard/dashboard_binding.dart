import 'package:app_commerce/controller/auth_controller.dart';
import 'package:app_commerce/controller/category_controller.dart';
import 'package:app_commerce/controller/dashboard_controller.dart';
import 'package:app_commerce/controller/home_controller.dart';
import 'package:app_commerce/controller/product_controller.dart';
import 'package:get/get.dart';

class DeshBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController());
    Get.put(HomeController());
    Get.put(ProductContrller());
    Get.put(CategoryController());
    Get.put(AuthController());
  }
}
