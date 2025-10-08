import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/utils/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/total_price_and_cart_section.dart';

class ProductDetailsScreens extends StatefulWidget {
  const ProductDetailsScreens({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreens> createState() => _ProductDetailsScreensState();
}

class _ProductDetailsScreensState extends State<ProductDetailsScreens> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title:Text( 'Product Detailss')),
      body: Column(
        children: [
          Expanded(child: Column(children: [

          ],)),
          TotalPriceAndCartSection(),
        ],
      ),
    );
  }
}


