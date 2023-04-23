import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InboxView extends GetView {
  const InboxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'InboxView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
