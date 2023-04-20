import 'package:cars/verification/controller/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              'Please check your email and sms  for verification code.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () => Expanded(
                      child: TextField(
                        controller: controller.numberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        enabled: !controller.isLoading.value,
                        decoration: InputDecoration(
                          hintText: 'Enter verification code',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.topLeft,
            child: Text(
              'Enter code sent to ${controller.number}',
              style: GoogleFonts.poppins(
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () => Expanded(
                      child: TextField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.number,
                        enabled: !controller.isLoading.value,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        decoration: InputDecoration(
                          hintText: 'Enter verification code',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.topLeft,
            child: Text(
              'Enter code sent to ${controller.email}',
              style: GoogleFonts.poppins(
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                controller.count.value != 60
                    ? ' You can request for new otp after '
                    : 'Didn\'t receive the code?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Obx(
            () => InkWell(
              onTap: () {
                if (controller.sendingOtp.isTrue) {
                  Fluttertoast.showToast(msg: 'Please wait for a while');
                } else {
                  controller.requestOtp();
                }
              },
              child: Text(
                controller.count.value != 60
                    ? '${controller.count.value} seconds'
                    : controller.sendingOtp.isTrue
                        ? 'Sending....'
                        : 'Resend Code',
                style: GoogleFonts.poppins(
                  color: Colors.indigo.shade500,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.verify();
            },
            child: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                height: 50,
                width: controller.isLoading.isTrue ? 50 : Get.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: controller.isLoading.isTrue
                      ? Colors.white
                      : Colors.indigo.shade500,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: controller.isLoading.isTrue
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.indigo.shade500,
                        ),
                      )
                    : Text(
                        'VERIFY & CONTINUE',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
