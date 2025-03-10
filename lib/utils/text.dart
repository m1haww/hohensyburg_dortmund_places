import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';

Widget buildHeight(BuildContext context, double percentage) {
  final height = MediaQuery.of(context).size.height;
  return SizedBox(height: height * percentage);
}

Widget buildWidth(BuildContext context, double percentage) {
  final width = MediaQuery.of(context).size.width;
  return SizedBox(width: width * percentage);
}

Widget buildTextAppbar(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      color: kWhite,
      fontSize: 28,
      fontWeight: FontWeight.w700,
      fontFamily: "Sf",
    ),
  );
}

Widget buildTextsplash(BuildContext context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: TextStyle(
      color: kWhite,
      fontSize: 44,
      fontWeight: FontWeight.w900,
      fontFamily: "Sf",
    ),
  );
}
