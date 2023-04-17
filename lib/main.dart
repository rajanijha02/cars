import 'package:cars/bindings.dart';
import 'package:cars/details/view/details_view.dart';
import 'package:cars/home/view/home_view.dart';
import 'package:cars/login/view/login_view.dart';
import 'package:cars/signup/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  List<String> args = [
    "a",
    "b",
    "c",
    "d",
  ];

  print(args.length);

  List<String> args2 = [
    ...args, // "a", "b", "c", "d"
    "e",
    "f",
    "g",
    "h",
  ];

  print(args2.length);

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
        GetPage(
          name: '/home',
          page: () => HomeView(),
          binding: HomeBindings(),
        ),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
