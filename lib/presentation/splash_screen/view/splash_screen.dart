// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spot_x/core/constants/texts.dart';
import 'package:spot_x/presentation/home_page/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePageScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/3574678/pexels-photo-3574678.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                  fit: BoxFit.cover)),
        ),
        Text(
          "data",
          style: MytextStyle.customWhiteHeadings,
        )
      ]),
      // body: Image.network(
      //   "https://images.pexels.com/photos/3574678/pexels-photo-3574678.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
