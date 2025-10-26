import 'package:e_commerce/features/shared/presentations/widgets/product_card.dart';
import 'package:e_commerce/features/shared/presentations/widgets/centered_circular_progress.dart';
import 'package:e_commerce/features/shared/presentations/controllers/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListController wishListController = Get.put(WishListController());

  @override
  void initState() {
    super.initState();
    wishListController.getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<WishListController>(
          builder: (controller) {
            if (controller.loadingWishlist) {
              return const CenteredCircularProgress();
            }

            if (controller.wishListProducts.isEmpty) {
              return const Center(
                child: Text(
                  'wishlist is empty ',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return GridView.builder(
              itemCount: controller.wishListProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final product = controller.wishListProducts[index];
                return ProductCard(productModel: product);
              },
            );
          },
        ),
      ),
    );
  }
}
