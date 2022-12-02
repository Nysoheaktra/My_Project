import 'package:app_commerce/controller/controller.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          blurRadius: 7,
        )
      ]),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(0, 0),
                        blurRadius: 3,
                      )
                    ]),
                child: Obx(
                  () => TextField(
                    autofocus: false,
                    controller: productContrller.searchTextEditingController,
                    onSubmitted: (val) {
                      productContrller.getProductByName(keyword: val);
                      dashBoardController.updateIndex(1);
                    },
                    onChanged: (val) {
                      productContrller.searchVal.value = val;
                    },
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      suffixIcon: productContrller.searchVal.value.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                productContrller.searchTextEditingController
                                    .clear();
                                productContrller.searchVal.value = '';
                                productContrller.getProduct();
                              },
                              icon: const Icon(Icons.clear))
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none),
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 3,
                  )
                ]),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Badge(
            badgeContent: const Text(
              "1",
              style: TextStyle(color: Colors.white),
            ),
            badgeColor: Theme.of(context).primaryColor,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 3,
                    )
                  ]),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }
}
