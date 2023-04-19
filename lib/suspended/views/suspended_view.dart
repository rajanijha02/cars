import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuspendedView extends StatelessWidget {
  const SuspendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Your account is suspended'),
          const Text('Please contact support'),
          TextButton(
            onPressed: () {
              Get.offAllNamed('/splash');
            },
            child: const Text('retry'),
          )
        ],
      ),
    );
  }
}
