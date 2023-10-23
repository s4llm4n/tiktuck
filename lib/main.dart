import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/constant.dart';
import 'package:firstproject/controllers/auth_controller.dart';
import 'package:firstproject/views/screens/auth/login_screen.dart';
import 'package:firstproject/views/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(((value) {
    Get.put(AuthController());
  }));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTuck',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: SignupScreen(),
    );
  }
}
