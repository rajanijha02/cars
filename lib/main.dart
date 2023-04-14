import 'package:cars/bindings.dart';
import 'package:cars/details/view/details_view.dart';
import 'package:cars/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/details",
      getPages: [
        GetPage(
          name: '/details',
          page: () => DetailsView(),
          binding: DetailsBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: LoginBindings(),
        ),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
