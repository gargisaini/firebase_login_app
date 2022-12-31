import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_app/auth_controller.dart';
import 'package:firebase_login_app/signup_page.dart';
import 'package:firebase_login_app/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

