// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_x/presentation/splash_screen/view/splash_screen.dart';

void main() {
  runApp(Spotx());
}

class Spotx extends StatelessWidget {
  const Spotx({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
