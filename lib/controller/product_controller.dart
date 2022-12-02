import 'package:app_commerce/model/product.dart';
import 'package:app_commerce/service/remote_service/remote_product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductContrller extends GetxController {
  static ProductContrller instance = Get.find();
  TextEditingController searchTextEditingController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      //print(productList.first);
    }
  }

  void getProductByName({required String keyword}) async {
    try {
      isProductLoading(true);

      var result = await RemoteProductService().getByName(keyword: keyword);
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      //print(productList.length);
    }
  }

  void getProductByCategory({required int id}) async {
    try {
      isProductLoading(true);

      var result = await RemoteProductService().getByCategory(id: id);
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      //print(productList.length);
    }
  }
}
