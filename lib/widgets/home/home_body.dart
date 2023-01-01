import 'package:flutter/material.dart';
import 'package:eshop_app_client/constants.dart';

import 'package:eshop_app_client/screens/details_screen.dart';
import 'package:eshop_app_client/widgets/home/product_cart.dart';

import '../../data/models/product.dart';

class HomeBody extends StatelessWidget {
  HomeBody({required this.myProducts});
  final List<Product> myProducts;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70.0),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: myProducts.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: myProducts[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: myProducts[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
