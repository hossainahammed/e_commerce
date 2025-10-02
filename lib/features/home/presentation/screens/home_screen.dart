import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/asset_paths.dart';
import 'package:e_commerce/app/utils/constant.dart';
import 'package:e_commerce/features/home/presentation/widgets/app_bar_icon_button.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_banner_slider.dart';
import 'package:e_commerce/features/shared/presentations/controllers/main_nav_controller.dart';
import 'package:e_commerce/features/shared/presentations/widgets/Product_category_item.dart';
import 'package:e_commerce/features/shared/presentations/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
          AppBarIconButton(onTap: () {}, iconData: Icons.person),
          AppBarIconButton(onTap: () {}, iconData: Icons.call),
          AppBarIconButton(
            onTap: () {},
            iconData: Icons.notification_add_outlined,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              HomeBannerSlider(),
              const SizedBox(height: 15),
              _buildSectionHeader(title: 'Categories', onTapSeeAll: () {
                Get.find<MainNavController>().moveToCategory();
              }),
              _buildCategoryList(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _buildNewProductList(),
              //productCard(),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _buildPopularProductList(),

              _buildSectionHeader(title: 'Special', onTapSeeAll: () {}),
              _buildSpecialProductList(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCategoryList(){
    return SizedBox(
      height: 100,
      child: ListView.separated(
          itemCount: 10,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return ProductCategoryItem();
          },
          separatorBuilder: (context,index){
            return SizedBox(width: 10,);
          }
      ),
    );
  }

  Widget _buildNewProductList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1,2,3,4,5,6,].map((e)=> productCard()).toList(),
      ),
    );
  }
  Widget _buildPopularProductList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1,2,3,4,5,6,].map((e)=> productCard()).toList(),
      ),
    );
  }

  Widget _buildSpecialProductList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1,2,3,4,5,6,].map((e)=> productCard()).toList(),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextButton(onPressed: onTapSeeAll, child: Text('See all')),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onSubmitted: (String? text) {},
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade100,
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}




