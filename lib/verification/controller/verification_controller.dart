import 'dart:async';
import 'dart:convert';

import 'package:cars/app_config.dart';
import 'package:cars/global/storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class VerificationController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxBool isLoading = false.obs;

  late StorageController storageController;

  String get email => storageController.user.value.email ?? "";
  int get number => storageController.user.value.number ?? 0;
  AppConfig appConfig = AppConfig();

  Timer? timer;
  RxInt count = 60.obs;
  RxBool sendingOtp = false.obs;

  @override
  void onInit() {
    super.onInit();
    numberController.clear();
    emailController.clear();
    storageController = Get.find<StorageController>();
    requestOtp();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    numberController.dispose();
  }

  void verify() async {
    try {
      if (numberController.text.isEmpty || emailController.text.isEmpty) {
        Fluttertoast.showToast(msg: 'Please enter OTP');
        return;
      }
      isLoading.value = true;
      http.Response response =
          await http.post(Uri.parse(appConfig.VERIFY_OTP_API), headers: {
        "authorization": storageController.token ?? "",
      }, body: {
        "number": number.toString(),
        "smsOtp": numberController.text,
        "email": email.toString(),
        "mailOtp": emailController.text,
      });

      if (response.statusCode != 200) {
        Fluttertoast.showToast(msg: json.decode(response.body)['message']);
        isLoading.value = false;
      } else {
        Get.dialog(
          AlertDialog(
            title: Text(
              'Success',
              style: GoogleFonts.poppins(
                color: Colors.greenAccent,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/success.png"),
                ),
                Text(
                  'Account verified successfully',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/home');
                },
                child: Text(
                  'Explore Dashboard',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        );
      }
    } catch (e) {
      isLoading.value = false;
      Fluttertoast.showToast(msg: '$e');
    }
  }

  requestOtp() async {
    try {
      if (count.value != 60) {
        Fluttertoast.showToast(msg: 'Please wait for ${count.value} seconds');
        return;
      }

      sendingOtp.value = true;

      http.Response response =
          await http.post(Uri.parse(appConfig.REQUEST_OTP_API), headers: {
        "authorization": storageController.token ?? "",
      });

      if (response.statusCode != 200) {
        Fluttertoast.showToast(msg: 'Error occured, please try again later');
      } else {
        Fluttertoast.showToast(msg: 'OTP sent successfully');

        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          print('count: ${count.value}');
          if (count.value == 0) {
            timer.cancel();
            count.value = 60;
          } else {
            count.value--;
          }
        });
      }
      sendingOtp.value = false;
    } catch (e) {
      sendingOtp.value = false;
      Fluttertoast.showToast(msg: '$e');
    }
  }
}
