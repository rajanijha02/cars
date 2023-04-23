import 'package:cars/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  GetStorage storage = GetStorage();

  Rx<UserModel> user = UserModel().obs;

  String? get token => storage.read('token');

  void saveToken(String token) {
    storage.write('token', token);
  }

  void saveUser(UserModel user) {
    this.user.value = user;
  }

  void logout() {
    storage.remove('token');
    Get.offAllNamed('/login');
  }
  
}
