import 'dart:convert';

import 'package:cars/app_config.dart';
import 'package:cars/global/storage_controller.dart';
import 'package:cars/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  RxString title = "MR.".obs;

  RxList<String> titles = <String>[].obs;

  RxString dob = 'DOB'.obs;

  RxBool showPassword = false.obs;
  late StorageController storageController;

  AppConfig appConfig = AppConfig();

  changeShowPasswordState() {
    showPassword.value = !showPassword.value;
  }

  @override
  onInit() {
    super.onInit();
    dob.value = "DOB";
    storageController = Get.find<StorageController>();

    loadTitles();
  }

  pickDate({required BuildContext context}) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Done"),
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (value) {
                    dob.value = value.toString().split(' ').first;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  registerAccount() async {
    try {
      isLoading.value = true;

      if (nameController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Name is required");
        isLoading.value = false;
        return;
      } else if (emailController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Email is required");
        isLoading.value = false;
        return;
      } else if (passwordController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Password is required");
        isLoading.value = false;
        return;
      } else if (numberController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Phone Number is required");
        isLoading.value = false;
        return;
      } else if (dob.value == "DOB") {
        Fluttertoast.showToast(msg: "Date of Birth is required");
        isLoading.value = false;
        return;
      }

      http.Response response = await http.post(
        Uri.parse(appConfig.SIGNUP_API),
        body: {
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "number": numberController.text,
          "dob": dob.value,
          "title": title.value,
        },
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Account Created Successfully");
        UserModel user = UserModel.fromJson(json.decode(response.body)['data']);
        storageController.saveUser(user);
        storageController.saveToken(user.token.toString());
        isLoading.value = false;
        Get.offAndToNamed('/verify');
      } else {
        isLoading.value = false;
        Fluttertoast.showToast(msg: json.decode(response.body)['message']);
      }
    } catch (e) {
      isLoading.value = false;
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  loadTitles() async {
    try {
      http.Response response = await http.get(Uri.parse(appConfig.TITLE_API));
      if (response.statusCode == 200) {
        titles.value = List<String>.from(json.decode(response.body)['data']);
        title.value = titles.first;
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
