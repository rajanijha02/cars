import 'package:cars/signup/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.indigo.shade500,
          ),
        ),
        title: Text(
          "CREATE ACCOUNT",
          style: GoogleFonts.poppins(
            color: Colors.indigo.shade500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 50,
                      width: 60,
                      child: Obx(
                        () => DropdownButtonFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          value: controller.title.value,
                          iconSize: 20,
                          items: controller.titles
                              .map(
                                (element) => DropdownMenuItem(
                                  value: element,
                                  child: Text(element),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            controller.title.value = value.toString();
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 4,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(
                        () => TextFormField(
                          controller: controller.nameController,
                          enabled: !controller.isLoading.value,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Your Name",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: 60,
                      child: const Icon(
                        Icons.email_outlined,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 4,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(
                        () => TextFormField(
                          controller: controller.emailController,
                          enabled: !controller.isLoading.value,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Your Email",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: 60,
                      child: const Icon(
                        Icons.phone_android,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 4,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(
                        () => TextFormField(
                          controller: controller.numberController,
                          enabled: !controller.isLoading.value,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Your Number",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: 60,
                      child: const Icon(
                        Icons.lock_outline,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 4,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          enabled: !controller.isLoading.value,
                          obscureText: !controller.showPassword.value,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Your Password",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => IconButton(
                      onPressed: () {
                        controller.changeShowPasswordState();
                      },
                      icon: Icon(
                        controller.showPassword.isTrue
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: Colors.indigo.shade500,
                      ),
                    ),
                  ),
                ],
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
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: 60,
                      child: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 4,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.pickDate(context: context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(
                          () => Text(controller.dob.value),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                controller.registerAccount();
              },
              child: Obx(
                () => AnimatedContainer(
                  height: 50,
                  width: controller.isLoading.isTrue
                      ? 50
                      : MediaQuery.of(context).size.width,
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: controller.isLoading.isTrue
                        ? Colors.white
                        : Colors.indigo.shade500,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: controller.isLoading.isTrue
                      ? CircularProgressIndicator(
                          strokeWidth: 1,
                          backgroundColor: Colors.indigo.shade500,
                        )
                      : Text(
                          "REGISTER & CONTINUE",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
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
