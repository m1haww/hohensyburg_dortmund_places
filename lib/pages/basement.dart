import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';

Widget buildContainer(BuildContext context, String text) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: double.infinity,
    height: height * 0.06,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: kLightYellow,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Sf",
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: kDarkBlue,
        ),
      ),
    ),
  );
}

Widget buildtext(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Sf",
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: kWhite,
    ),
  );
}

Widget buildField(
  BuildContext context,
  String text,
  Color colortext,
  Color colorhint, {
  required TextEditingController controller,
}) {
  final height = MediaQuery.of(context).size.height;
  return Container(
    width: double.infinity,
    height: height * 0.055,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: kDarkMidBlue,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            fontFamily: "Sf",
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: colorhint,
          ),

          border: InputBorder.none,
        ),
        style: TextStyle(
          fontFamily: "Sf",
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: colortext,
        ),
        cursorColor: kWhite,
      ),
    ),
  );
}
