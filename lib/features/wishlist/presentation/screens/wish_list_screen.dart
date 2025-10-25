import 'package:e_commerce/features/shared/presentations/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishtListScreen extends StatefulWidget {
  const WishtListScreen({super.key});




  @override
  State<WishtListScreen> createState() => _WishtListScreenState();
}

class _WishtListScreenState extends State<WishtListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist')),
      body: GridView.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8
        ),
        itemBuilder: ( context,  index) {
         // return FittedBox(child: productCard());
        },
      ),
    );
  }
}
