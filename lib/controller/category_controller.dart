import 'package:app_commerce/model/category.dart';
import 'package:app_commerce/service/local_server/local_category_server.dart';
import 'package:app_commerce/service/remote_service/remote_category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();

  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    await _localCategoryService.init();
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    try {
      isCategoryLoading(true);
      if (_localCategoryService.getcategories().isNotEmpty) {
        categoryList.assignAll(_localCategoryService.getcategories());
      }
      var result = await RemoteCategoryService().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
        _localCategoryService.assignAllCategories(
            categories: categoryListFromJson(result.body));
      }
    } finally {
      isCategoryLoading(false);
    }
  }
}
