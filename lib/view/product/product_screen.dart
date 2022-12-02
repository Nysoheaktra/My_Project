import 'package:app_commerce/component/main_header.dart';
import 'package:app_commerce/controller/controller.dart';

import 'package:app_commerce/view/product/component/product_grid.dart';
import 'package:app_commerce/view/product/component/product_loading_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: Obx(() {
              if (productContrller.isProductLoading.value) {
                return const ProductLoadingGrid();
              } else {
                if (productContrller.productList.isNotEmpty) {
                  return ProductGrid(products: productContrller.productList);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/product_not_found.png'),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          'Product not found!',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  );
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
