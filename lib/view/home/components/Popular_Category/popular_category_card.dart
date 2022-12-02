import 'package:app_commerce/const.dart';
import 'package:app_commerce/model/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularCategoryCard extends StatelessWidget {
  final Category category;
  const PopularCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: CachedNetworkImage(
        imageUrl: baseUrl + category.image,
        imageBuilder: (context, imageProvider) => Material(
          elevation: 5,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 270,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                category.name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        placeholder: (context, url) => Material(
          elevation: 5,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              width: 270,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Material(
          elevation: 5,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 270,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}