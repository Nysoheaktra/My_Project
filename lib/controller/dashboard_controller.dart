import 'package:get/get.dart';

class DashBoardController extends GetxController {
  static DashBoardController instance = Get.find();

  var tabIndex = 0;
  void updateIndex(int index) {
    tabIndex = index;
    update();
  }
}
