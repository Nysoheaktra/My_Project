import 'package:app_commerce/component/main_header.dart';
import 'package:app_commerce/controller/controller.dart';

import 'package:app_commerce/view/home/components/Popular_Category/popular_category.dart';
import 'package:app_commerce/view/home/components/Popular_Category/popular_category_loading.dart';
import 'package:app_commerce/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:app_commerce/view/home/components/carousel_slider/carousel_silder_view.dart';
import 'package:app_commerce/view/home/components/popular_product/popular_product_loading.dart';
import 'package:app_commerce/view/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/popular_product/popular_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Obx(() {
                  if (homeController.bannerList.isNotEmpty) {
                    return CarouselSilderView(
                        bannerList: homeController.bannerList);
                  } else {
                    return const CarouselLoading();
                  }
                }),
                const SectionTitle(title: "Product Category"),
                Obx(() {
                  if (homeController.popularCategoryList.isNotEmpty) {
                    return PopularCategory(
                        categories: homeController.popularCategoryList);
                  } else {
                    return const PopularCategoryLoading();
                  }
                }),
                const SectionTitle(title: "Product Production"),
                Obx(() {
                  if (homeController.popularProductList.isNotEmpty) {
                    return PopularProduct(
                        popularProduct: homeController.popularProductList);
                  } else {
                    return const PopularProductLoading();
                  }
                }),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
