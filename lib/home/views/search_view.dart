import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchView extends GetView {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'SearchView is working',
        style: TextStyle(fontSize: 20),
      ),
    ); 
  }
}
