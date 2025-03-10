import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/diary_info.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/provider_app.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';
import 'package:provider/provider.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  Map<String, String>? _placeData;

  @override
  Widget build(BuildContext context) {
    final good = Provider.of<ProviderApp>(context).routee;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kDarkBlue,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: buildTextAppbar(context, "Ways Diary"),
        backgroundColor: kDarkBlue,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_placeData != null) ...[
              Text(
                _placeData!['heading'] ?? 'No Title',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kWhite,
                ),
              ),
              Text(
                _placeData!['place1'] ?? 'No Address',
                style: TextStyle(fontSize: 18, color: kWhite),
              ),
              Image.asset(_placeData!['image1'] ?? 'default_image.png'),
            ],
          ],
        ),
      ),
      floatingActionButton: Container(
        width: width * 0.35,
        height: height * 0.07,
        child: FloatingActionButton(
          backgroundColor: kLightYellow,
          onPressed: () async {
            final result = await Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => DiaryInfo()),
            );

            if (result != null && result is Map<String, String>) {
              setState(() {
                _placeData = result; // Salvăm datele primite
              });
            }
          },
          child: Center(child: Icon(Icons.add, color: kDarkBlue, size: 25)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
