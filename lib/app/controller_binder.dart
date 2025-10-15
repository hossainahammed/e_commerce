import 'package:e_commerce/app/set_up_network_client.dart';
import 'package:e_commerce/features/shared/presentations/controllers/main_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies(){
   // Get.put(AuthController());
    Get.put(MainNavController());
    Get.put(setUpNetworkClient());
    //Get.put(SignUpController());
    // Get.put(VerifyOtpController());
    // Get.put(LoginController());
    // Get.put(HomeSliderController());
    // Get.put(CategoryController());
    // Get.put(CartListController());


  }
}
