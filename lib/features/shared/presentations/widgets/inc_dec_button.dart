import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key});

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(4)
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.remove,color: Colors.white,),
          ),
        ),
        Text('1',style: Theme.of(context).textTheme.titleLarge),
        Container(
          decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4)
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.add,color: Colors.white,),
          ),
        ),
      ],
    );
  }
}
