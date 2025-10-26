class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String loginUrl = '$_baseUrl/auth/login';
  static const String homeSlidersUrl = '$_baseUrl/slides';

  static String categoryList(int pageNo, int pageSize) =>
      '$_baseUrl/categories?count=$pageSize&page=$pageNo';

  static String productList(int pageNo, int pageSize, String categoryId) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNo&category=$categoryId';

  static String productDetailsUrl(String productId) =>
      '$_baseUrl/products/id/$productId';

  static const String addToCartUrl = '$_baseUrl/cart';
  static const String cartListUrl = '$_baseUrl/cart';
  static const String wishListUrl = '$_baseUrl/wishlist';


  static String newProductsUrl(int pageNo, int pageSize) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNo&sort=new';

  static String specialProductsUrl(int pageNo, int pageSize) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNo&sort=special';

  static String popularProductsUrl(int pageNo, int pageSize) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNo&sort=popular';

}