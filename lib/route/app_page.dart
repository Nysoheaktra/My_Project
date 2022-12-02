import 'package:app_commerce/route/route.dart';
import 'package:app_commerce/view/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

import '../view/dashboard/dashboard_binding.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const DashBoardScreen(),
      binding: DeshBoardBinding(),
    )
  ];
}
