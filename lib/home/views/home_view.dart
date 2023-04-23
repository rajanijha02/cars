import 'package:cars/home/controller/home_controller.dart';
import 'package:cars/home/views/dashboard_view.dart';
import 'package:cars/home/views/drawer_view.dart';
import 'package:cars/home/views/inbox_view.dart';
import 'package:cars/home/views/navigation_view.dart';
import 'package:cars/home/views/profile_view.dart';
import 'package:cars/home/views/publish_view.dart';
import 'package:cars/home/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ride',
              style: GoogleFonts.poppins(
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: Badge(
                backgroundColor: Colors.red,
                label: Text(
                  '2',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => [
          DashboardView(), // Index 0
          SearchView(), // Index 1
          PublishView(), // Index 2
          InboxView(), // Index 3
          ProfileView(), // Index 4
        ][controller.selectedIndex.value],
      ),
      bottomNavigationBar: const NavigationView(),
    );
  }
}
