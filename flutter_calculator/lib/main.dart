import 'package:flutter/material.dart';
import 'package:flutter_calculator/bindings/my_bindings.dart';
import 'package:flutter_calculator/screen/main_screen.dart';
import 'package:flutter_calculator/screen/welcome_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      initialBinding: MyBindings(),
      title: "Flutter Calculator",
      home: WelcomeScreen(),
    );
  }
}
