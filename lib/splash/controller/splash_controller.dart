import 'dart:convert';
import 'dart:io';

import 'package:cars/app_config.dart';
import 'package:cars/global/storage_controller.dart';
import 'package:cars/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController {
/**
 * -> Get token from local storage
 * -> If token is null, navigate to details page 
 * -> If token is not null, validate token and navigate to home , suspanded or login page
 * -> if accountStatus === 'pending' navigate to verification page
 * -> if accountStatus === 'suspended' navigate to suspended page
 * -> if accountStatus === 'verified' navigate to home page 
 * 
 * 
 */
  RxBool isLoading = true.obs;
  late StorageController storageController;
  AppConfig appConfig = AppConfig();
  @override
  void onInit() {
    super.onInit();
    storageController = Get.find<StorageController>();
    validateToken();
  }

  validateToken() async {
    try {
      String? token = storageController.token;

      if (token == null) {
        Get.offNamed('/details');
      } else {
        // validate token
        // if token is valid, navigate to home page
        // if token is invalid, navigate to login page

        http.Response response =
            await http.get(Uri.parse(appConfig.VALIDATE_TOKEN_API), headers: {
          "authorization": token,
        });

        if (response.statusCode != 200) {
          if (json.decode(response.body)['message'] == "NOT_EXIST") {
            Get.offNamed('/details');
          } else {
            Get.dialog(
              AlertDialog(
                title: const Text("Error"),
                content: Text(json.decode(response.body)['message']),
                actions: [
                  TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: const Text("CLOSE APP"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      validateToken();
                    },
                    child: const Text('Retry'),
                  )
                ],
              ),
            );
          }
        } else {
          UserModel user =
              UserModel.fromJson(json.decode(response.body)['user']);

          storageController.saveUser(user);
          if (user.status == 'pending') {
            print('Hello World');
            Get.offAllNamed('/verify');
          } else if (user.status == 'suspended') {
            Get.offAllNamed('/suspended');
          } else {
            Get.offAllNamed('/home');
          }
        }
      }
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                exit(0);
              },
              child: const Text("CLOSE APP"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                validateToken();
              },
              child: const Text('Retry'),
            )
          ],
        ),
      );
    }
  }
}
