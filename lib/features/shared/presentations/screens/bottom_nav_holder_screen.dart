import 'package:e_commerce/features/carts/presentation/screens/cart_screen.dart';
import 'package:e_commerce/features/category/presentation/screens/category_list_screen.dart';
import 'package:e_commerce/features/home/presentation/controllers/home_slider_controller.dart';
import 'package:e_commerce/features/home/presentation/screens/home_screen.dart';
import 'package:e_commerce/features/shared/presentations/controllers/category_controller.dart';
import 'package:e_commerce/features/shared/presentations/controllers/main_nav_controller.dart';
import 'package:e_commerce/features/wishlist/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BottomNavHolderScreen extends StatefulWidget {
  static const String name = '/bottom-nav-holder';
  const BottomNavHolderScreen({super.key});

  @override
  State<BottomNavHolderScreen> createState() => _BottomNavHolderScreenState();
}

class _BottomNavHolderScreenState extends State<BottomNavHolderScreen> {
  final List<Widget>_screens =[
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    WishtListScreen(),

  ];
 @override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getHomeSliders();
    Get.find<CategoryController>().getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavController>(
      builder: (mainNavController) {
        return Scaffold(
          body: _screens[mainNavController.currentIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: mainNavController.currentIndex,
            onDestinationSelected: mainNavController.changeIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.dashboard_customize_outlined),
                label: 'Categories',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_checkout),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: 'Wishlist',
              ),
            ],
          ),
        );
      },
    );
  }
}
