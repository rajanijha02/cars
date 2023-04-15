import 'package:cars/bindings.dart';
import 'package:cars/details/view/details_view.dart';
import 'package:cars/login/view/login_view.dart';
import 'package:cars/signup/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        GetPage(
          name: '/signup',
          page: () => SignupView(),
          binding: SignupBindings(),
        ),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
