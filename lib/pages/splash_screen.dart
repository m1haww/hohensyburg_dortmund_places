import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/navigation.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => NavigationPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image(
            image: AssetImage("images/loader.png"),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeight(context, 0.1),

                Center(
                  child: buildTextsplash(
                    context,
                    "Hohensyburg \n Dortmund \n Places",
                  ),
                ),
                buildHeight(context, 0.15),

                Center(child: Image(image: AssetImage("images/noto_sun.png"))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
