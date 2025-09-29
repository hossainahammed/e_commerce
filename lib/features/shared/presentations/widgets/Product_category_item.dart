import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.computer,
            size: 32,
            color: AppColors.themeColor,
          ),
        ),
        Text(
          'Electronics',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColors.themeColor),
        ),
      ],
    );
  }
}