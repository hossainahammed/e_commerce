import 'package:e_commerce/features/shared/presentations/controllers/main_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(MainNavController());

  }
}