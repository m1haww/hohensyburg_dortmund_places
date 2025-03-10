import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/add_places.dart';
import 'package:hohensyburg_dortmund_places/pages/basement.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class DiaryAdd extends StatefulWidget {
  const DiaryAdd({super.key});

  @override
  State<DiaryAdd> createState() => _DiaryAddState();
}

class _DiaryAddState extends State<DiaryAdd> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kLightYellow),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: Text(
          "Way",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            fontFamily: "Sf",
            color: kWhite,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildtext(context, "Add places"),
              buildHeight(context, 0.02),
              Container(
                width: double.infinity,
                height: height * 0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kLightYellow,
                ),
                child: Center(
                  child: Icon(Icons.add, size: 24, color: kDarkBlue),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => AddPlaces()),
                  );
                },
                child: buildContainer(context, "Next"),
              ),
            ],
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
}
