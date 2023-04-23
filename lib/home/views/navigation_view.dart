import 'package:cars/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationView extends GetView<HomeController> {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.indigo.shade500,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
        ),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.selectedIndex.value = 0;
                },
                child: SizedBox(
                  height: 70,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 50,
                        width: controller.selectedIndex.value == 0 ? 70 : 60,
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 0
                              ? Colors.white
                              : Colors.indigo.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: controller.selectedIndex.value == 0
                                  ? Colors.indigo.shade500
                                  : Colors.white,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'HOME',
                              style: GoogleFonts.poppins(
                                color: controller.selectedIndex.value == 0
                                    ? Colors.indigo
                                    : Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: controller.selectedIndex.value == 0 ? 60 : 0,
                        height: controller.selectedIndex.value == 0 ? 2 : 0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.selectedIndex.value = 1;
                },
                child: SizedBox(
                  height: 70,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 50,
                        width: controller.selectedIndex.value == 1 ? 70 : 60,
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 1
                              ? Colors.white
                              : Colors.indigo.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color: controller.selectedIndex.value == 1
                                  ? Colors.indigo.shade500
                                  : Colors.white,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'SEARCH',
                              style: GoogleFonts.poppins(
                                color: controller.selectedIndex.value == 1
                                    ? Colors.indigo.shade500
                                    : Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: controller.selectedIndex.value == 1 ? 60 : 0,
                        height: controller.selectedIndex.value == 1 ? 2 : 0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.selectedIndex.value = 2;
                },
                child: SizedBox(
                  height: 70,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 50,
                        width: controller.selectedIndex.value == 2 ? 70 : 60,
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 2
                              ? Colors.white
                              : Colors.indigo.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: controller.selectedIndex.value == 2
                                  ? Colors.indigo.shade500
                                  : Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'PUBLISH',
                              style: GoogleFonts.poppins(
                                color: controller.selectedIndex.value == 2
                                    ? Colors.indigo.shade500
                                    : Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: controller.selectedIndex.value == 2 ? 60 : 0,
                        height: controller.selectedIndex.value == 2 ? 2 : 0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.selectedIndex.value = 3;
                },
                child: SizedBox(
                  height: 70,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 50,
                        width: controller.selectedIndex.value == 3 ? 70 : 60,
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 3
                              ? Colors.white
                              : Colors.indigo.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              color: controller.selectedIndex.value == 3
                                  ? Colors.indigo.shade500
                                  : Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'INBOX',
                              style: GoogleFonts.poppins(
                                color: controller.selectedIndex.value == 3
                                    ? Colors.indigo.shade500
                                    : Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: controller.selectedIndex.value == 3 ? 60 : 0,
                        height: controller.selectedIndex.value == 3 ? 2 : 0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.selectedIndex.value = 4;
                },
                child: SizedBox(
                  height: 70,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 50,
                        width: controller.selectedIndex.value == 4 ? 70 : 60,
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 4
                              ? Colors.white
                              : Colors.indigo.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_outline_outlined,
                              color: controller.selectedIndex.value == 4
                                  ? Colors.indigo.shade500
                                  : Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'PROFILE',
                              style: GoogleFonts.poppins(
                                color: controller.selectedIndex.value == 4
                                    ? Colors.indigo.shade500
                                    : Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: controller.selectedIndex.value == 4 ? 60 : 0,
                        height: controller.selectedIndex.value == 4 ? 2 : 0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
