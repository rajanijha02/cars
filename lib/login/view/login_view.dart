import 'package:cars/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAndToNamed('/details');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.indigo.shade500,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'What\'s your email and password?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.emailController,
                          onChanged: (value) {
                            if (controller.emailController.text.isNotEmpty) {
                              controller.showClear.value = true;
                            } else {
                              controller.showClear.value = false;
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      controller.showClear.isTrue
                          ? IconButton(
                              onPressed: () {
                                controller.emailController.clear();
                                controller.showClear.value = false;
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.indigo,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          obscureText: !controller.showPassword.value,
                          onChanged: (value) {
                            if (controller.passwordController.text.isNotEmpty) {
                              controller.isShowPassword.value = true;
                            } else {
                              controller.isShowPassword.value = false;
                            }
                          },
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      controller.isShowPassword.isTrue
                          ? IconButton(
                              onPressed: () {
                                controller.showPassword.value =
                                    !controller.showPassword.value;
                              },
                              icon: Icon(
                                controller.showPassword.isTrue
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                                color: Colors.indigo,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.indigo.shade500,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.offAndToNamed('/home');
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade500,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
