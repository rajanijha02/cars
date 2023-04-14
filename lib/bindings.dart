import 'package:cars/details/controller/details_controller.dart';
import 'package:cars/login/controller/login_controller.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DetailsController());
  }
}


class LoginBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginController());
  }
}