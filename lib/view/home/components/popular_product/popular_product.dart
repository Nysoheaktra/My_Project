import 'package:app_commerce/model/product.dart';
import 'package:app_commerce/view/home/components/popular_product/popular_product_card.dart';

import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  final List<Product> popularProduct;
  const PopularProduct({super.key, required this.popularProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: popularProduct.length,
        itemBuilder: (context, index) => PopularProductionCard(
          product: popularProduct[index],
        ),
      ),
    );
  }
}
