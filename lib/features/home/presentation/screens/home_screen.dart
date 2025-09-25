import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/asset_paths.dart';
import 'package:e_commerce/features/home/presentation/widgets/app_bar_icon_button.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(AssethPaths.logoNavSvg),
        actions: [
          AppBarIconButton(onTap: () {  }, iconData: Icons.person,),
          AppBarIconButton(onTap: () {  }, iconData: Icons.call,),
          AppBarIconButton(onTap: () {  }, iconData: Icons.notification_add_outlined,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            _buildSearchBar(),
            const SizedBox(height: 17,),
            HomeBannerSlider()

          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(){
    return TextField(
      onSubmitted: (String? text){},
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          hintText: 'Search',
          fillColor: Colors.grey.shade100,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search)
      ),
    );
  }
}


