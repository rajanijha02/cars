import 'dart:convert';

import 'package:cars/app_config.dart';
import 'package:cars/global/storage_controller.dart';
import 'package:cars/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isShowPassword = false.obs;
  RxBool showClear = false.obs;
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;

  AppConfig appConfig = AppConfig();
  late StorageController storageController;

  @override
  void onInit() {
    super.onInit();
    emailController.clear();
    passwordController.clear();
    storageController = Get.find<StorageController>();
  }

  login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password');
      return;
    }
    isLoading.value = true;
    try {
      http.Response response = await http.post(
        Uri.parse(appConfig.LOGIN_API),
        body: {
          'number': emailController.text,
          'password': passwordController.text,
        },
      );
      if (response.statusCode != 200) {
        Get.snackbar('Error', json.decode(response.body)['message']);
      } else {
        Get.snackbar('Success', 'Login successful');
        UserModel user = UserModel.fromJson(json.decode(response.body)['user']);
        storageController.saveUser(user);
        storageController.saveToken(
          user.token ?? "",
        );

        if (user.status == 'pending') {
          Get.offAllNamed('/verify');
        } else if (user.status == 'suspended') {
          Get.offAllNamed('/suspended');
        } else {
          Get.offAllNamed('/home');
        }
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
