import 'package:cars/details/controller/details_controller.dart';
import 'package:cars/global/storage_controller.dart';
import 'package:cars/home/controller/home_controller.dart';
import 'package:cars/login/controller/login_controller.dart';
import 'package:cars/signup/controller/signup_controller.dart';
import 'package:cars/splash/controller/splash_controller.dart';
import 'package:cars/verification/controller/verification_controller.dart';
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

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class StorageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StorageController());
  }
}

class VerificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(VerificationController());
  }
}

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
