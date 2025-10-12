import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/utils/constant.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_image_slider.dart';
import 'package:e_commerce/features/shared/presentations/widgets/inc_dec_button.dart';
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
      appBar: AppBar(title: const Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const ProductImageSlider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children:[
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Nike A123 - New Edition of Jordan Sports',
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        size: 24,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(width: 4),
                                      Text('4.2', style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('Reviews'),
                                  ),
                                  const Spacer(),
                                  Card(
                                    color: AppColors.themeColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.favorite_outline,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IncDecButton()

                        ],
                      )

                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,

                  ),
                ),
              ],
            ),
          ),
          const TotalPriceAndCartSection(),
        ],
      ),
    );
  }
}
