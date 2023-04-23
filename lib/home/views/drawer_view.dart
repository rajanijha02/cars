import 'package:cars/global/storage_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerView extends GetView<StorageController> {
  const DrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Container(),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'LOGOUT',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              controller.logout();
            },
          ),
        ],
      ),
    );
  }
}
