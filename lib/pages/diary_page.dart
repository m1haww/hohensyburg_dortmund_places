import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/diary_info.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kDarkBlue,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: buildTextAppbar(context, "Settings"),
        backgroundColor: kDarkBlue,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add content here
          ],
        ),
      ),
      floatingActionButton: Container(
        width: width * 0.35,
        height: height * 0.07,
        child: FloatingActionButton(
          backgroundColor: kLightYellow,
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => DiaryInfo()),
            );
          },
          child: Center(child: Icon(Icons.add, color: kDarkBlue, size: 25)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
