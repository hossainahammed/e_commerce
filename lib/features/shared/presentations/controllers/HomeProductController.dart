import 'package:e_commerce/app/urls.dart';
import 'package:e_commerce/core/models/network_response.dart';
import 'package:e_commerce/core/services/network_caller.dart';
import 'package:e_commerce/features/shared/data/models/product_model.dart';
import 'package:get/get.dart';

class HomeProductController extends GetxController {
  bool _loadingNew = false;
  bool _loadingSpecial = false;
  bool _loadingPopular = false;

  List<ProductModel> _newProducts = [];
  List<ProductModel> _specialProducts = [];
  List<ProductModel> _popularProducts = [];

  bool get loadingNew => _loadingNew;
  bool get loadingSpecial => _loadingSpecial;
  bool get loadingPopular => _loadingPopular;

  List<ProductModel> get newProducts => _newProducts;
  List<ProductModel> get specialProducts => _specialProducts;
  List<ProductModel> get popularProducts => _popularProducts;

  Future<void> getNewProducts() async {
    _loadingNew = true;
    update();
    final response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.newProductsUrl(1, 10),
    );
    if (response.isSuccess) {
      _newProducts = (response.body!['data']['results'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
    _loadingNew = false;
    update();
  }

  Future<void> getSpecialProducts() async {
    _loadingSpecial = true;
    update();
    final response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.specialProductsUrl(1, 10),
    );
    if (response.isSuccess) {
      _specialProducts = (response.body!['data']['results'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
    _loadingSpecial = false;
    update();
  }

  Future<void> getPopularProducts() async {
    _loadingPopular = true;
    update();
    final response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.popularProductsUrl(1, 10),
    );
    if (response.isSuccess) {
      _popularProducts = (response.body!['data']['results'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
    _loadingPopular = false;
    update();
  }
}
