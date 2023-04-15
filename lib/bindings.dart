import 'package:cars/details/controller/details_controller.dart';
import 'package:cars/login/controller/login_controller.dart';
import 'package:cars/signup/controller/signup_controller.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailsController());
  }
}

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
