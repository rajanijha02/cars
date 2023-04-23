import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PublishView extends GetView {
  const PublishView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'PublishView is working',
        style: TextStyle(fontSize: 20),
      ),
    ); 
  }
}
