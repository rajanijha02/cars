import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileView extends GetView {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'ProfileView is working',
        style: TextStyle(fontSize: 20),
      ),
    ); 
  }
}
