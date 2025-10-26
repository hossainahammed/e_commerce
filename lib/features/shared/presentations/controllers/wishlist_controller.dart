import 'package:e_commerce/app/urls.dart';
import 'package:e_commerce/core/models/network_response.dart';
import 'package:e_commerce/core/services/network_caller.dart';
import 'package:e_commerce/features/shared/data/models/product_model.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _getWishListInProgress = false;
  List<ProductModel> _wishListProducts = [];
  String? _errorMessage;

  bool get loadingWishlist => _getWishListInProgress;
  List<ProductModel> get wishListProducts => _wishListProducts;
  String? get errorMessage => _errorMessage;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _getWishListInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.wishListUrl,
    );

    if (response.isSuccess) {
      _wishListProducts.clear();

      // Assuming API returns a "data" field with list of products
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        _wishListProducts.add(ProductModel.fromJson(jsonData));
      }

      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getWishListInProgress = false;
    update();

    return isSuccess;
  }

  // Optional: toggle wishlist items (for add/remove locally)
  void toggleWishlist(ProductModel product) {
    if (_wishListProducts.any((p) => p.id == product.id)) {
      _wishListProducts.removeWhere((p) => p.id == product.id);
    } else {
      _wishListProducts.add(product);
    }
    update();
  }
}
