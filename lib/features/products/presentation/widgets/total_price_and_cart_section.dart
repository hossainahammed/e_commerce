import 'package:e_commerce/app/app_colors.dart' show AppColors;
import 'package:e_commerce/app/utils/constant.dart';
import 'package:flutter/material.dart';

class TotalPriceAndCartSection extends StatelessWidget {
  const TotalPriceAndCartSection({super.key});





  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              Text('${takaSign}100',style: textTheme.titleMedium?.copyWith(color:AppColors.themeColor ),),
            ],),
          SizedBox(
              width:120,
              child: FilledButton(onPressed: () {}, child: Text('Add to Cart')))
        ],
      ),
    );
  }
}