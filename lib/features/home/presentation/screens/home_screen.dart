
import 'package:e_commerce/features/shared/presentations/controllers/HomeProductController.dart';
import 'package:e_commerce/features/shared/presentations/controllers/category_controller.dart';
import 'package:e_commerce/features/shared/presentations/controllers/main_nav_controller.dart';
import 'package:e_commerce/features/shared/presentations/widgets/Product_category_item.dart';
import 'package:e_commerce/features/shared/presentations/widgets/centered_circular_progress.dart';
import 'package:e_commerce/features/shared/presentations/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_slider_controller.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_banner_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  final HomeProductController homeProductController = Get.put(HomeProductController());

  @override
  void initState() {
    super.initState();
    homeProductController.getNewProducts();
    homeProductController.getSpecialProducts();
    homeProductController.getPopularProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //title: SvgPicture.asset(AssetPaths.logoNavSvg),
        actions: [
          AppBarIconButton(onTap: () {}, iconData: Icons.person),
          AppBarIconButton(onTap: () {}, iconData: Icons.call),
          AppBarIconButton(
            onTap: () {},
            iconData: Icons.notifications_on_outlined,
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
              GetBuilder<HomeSliderController>(
                  builder: (controller) {
                    if (controller.getSlidersInProgress) {
                      return SizedBox(
                          height: 180,
                          child: CenteredCircularProgress());
                    }
                    return HomeBannerSlider(sliders: controller.sliders);
                  }
              ),
              const SizedBox(height: 16),
              _buildSectionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  Get.find<MainNavController>().moveToCategory();
                },
              ),
              _buildCategoryList(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _buildNewProductList(),
              _buildSectionHeader(title: 'Special', onTapSeeAll: () {}),
              _buildSpecialProductList(),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _buildPopularProductList()
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryController>(
          builder: (controller) {
            if (controller.isInitialLoading) {
              return CenteredCircularProgress();
            }
            return ListView.separated(
              itemCount: controller.categoryList.length > 10 ? 10 : controller
                  .categoryList.length,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCategoryItem(
                  categoryModel: controller.categoryList[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
            );
          }
      ),
    );
  }

  // Widget _buildNewProductList() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //        children: [1, 2, 3, 4, 56].map((e) => ProductCard()).toList(),
  //     ),
  //   );
  // }
  //
  // Widget _buildPopularProductList() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       // children: [1, 2, 3, 4, 56].map((e) => ProductCard()).toList(),
  //     ),
  //   );
  // }
  //
  // Widget _buildSpecialProductList() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       // children: [1, 2, 3, 4, 56].map((e) => ProductCard()).toList(),
  //     ),
  //   );
  // }


  Widget _buildNewProductList() {
    return GetBuilder<HomeProductController>(
      builder: (controller) {
        if (controller.loadingNew) {
          return const CenteredCircularProgress();
        }
        return SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.newProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(productModel: controller.newProducts[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        );
      },
    );
  }

  Widget _buildSpecialProductList() {
    return GetBuilder<HomeProductController>(
      builder: (controller) {
        if (controller.loadingSpecial) {
          return const CenteredCircularProgress();
        }
        return SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.specialProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(productModel: controller.specialProducts[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        );
      },
    );
  }

  Widget _buildPopularProductList() {
    return GetBuilder<HomeProductController>(
      builder: (controller) {
        if (controller.loadingPopular) {
          return const CenteredCircularProgress();
        }
        return SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.popularProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(productModel: controller.popularProducts[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        );
      },
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
