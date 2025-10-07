import 'package:flutter/material.dart';

class ProductDetailsScreens extends StatefulWidget {
  const ProductDetailsScreens({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreens> createState() => _ProductDetailsScreensState();
}

class _ProductDetailsScreensState extends State<ProductDetailsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text( 'Product Details')),
    );
  }
}
