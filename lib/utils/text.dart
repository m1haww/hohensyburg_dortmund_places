import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';

Widget buildTextAppBar(BuildContext context, String text) {
  return Text(
    text,style: TextStyle(
      color: kWhite,
      fontSize: 28,fontWeight: FontWeight.w700,fontFamily: "Sf",
    )
  );
}