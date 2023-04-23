import 'package:cars/bindings.dart';
import 'package:cars/details/view/details_view.dart';
import 'package:cars/home/views/home_view.dart';
import 'package:cars/login/view/login_view.dart';
import 'package:cars/signup/view/signup_view.dart';
import 'package:cars/splash/views/splash_view.dart';
import 'package:cars/suspended/views/suspended_view.dart';
import 'package:cars/verification/views/verification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
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
      initialRoute: "/splash",
      initialBinding: StorageBindings(),
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashView(),
          binding: SplashBinding(),
        ),
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
        GetPage(
          name: '/verify',
          page: () => VerificationView(),
          binding: VerificationBindings(),
        ),
        GetPage(
          name: '/suspended',
          page: () => SuspendedView(),
        )
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
