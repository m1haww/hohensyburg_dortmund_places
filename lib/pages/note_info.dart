import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/utils/classes.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

class NoteInfo extends StatefulWidget {
  final Library item;

  const NoteInfo({super.key, required this.item});

  @override
  State<NoteInfo> createState() => _NoteInfoState();
}

class _NoteInfoState extends State<NoteInfo> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    final height = MediaQuery.of(context).size.height;

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeight(context, 0.01),

                Image(
                  image: AssetImage(item.image),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                buildHeight(context, 0.001),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: "Sf",
                          color: kWhite,
                        ),
                      ),
                      buildHeight(context, 0.01),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "Sf",
                          color: kWhite,
                        ),
                      ),
                      ////////
                      ///
                      ///
                      buildHeight(context, 0.02),
                      Container(
                        height: height * 0.05,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kDarkMidBlue,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 12,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Duration",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: "Sf",
                                    color: kWhite,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  item.duration,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: "Sf",
                                    color: kWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      buildHeight(context, 0.04),
                      Text(
                        "Places",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: "Sf",
                          color: kWhite,
                        ),
                      ),
                      buildHeight(context, 0.02),

                      Container(
                        height: height * 0.2,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildPlaceCard(item.place1_image, item.place1),
                            _buildDashedLine(), // Linie punctată
                            _buildPlaceCard(item.place2_image, item.place2),
                            _buildDashedLine(),
                            _buildPlaceCard(item.place3_image, item.place3),
                          ],
                        ),
                      ),

                      buildHeight(context, 0.03),
                      Text(
                        "Reviews",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: "Sf",
                          color: kWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: kDarkMidBlue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(image: AssetImage("images/Avatar.png")),
                            buildWidth(context, 0.01),
                            Text(
                              item.reviewer,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: "Sf",
                                color: kWhite,
                              ),
                            ),
                            Spacer(),
                            Image(
                              image: AssetImage("images/Frame 1462983574.png"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Text(
                          item.reviewerdescription,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: "Sf",
                            color: kWhite,
                          ),
                        ),
                      ),
                      buildHeight(context, 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                        child: Text(
                          item.date,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            fontFamily: "Sf",
                            color: kWhiteOpacity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                buildHeight(context, 0.008),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: kDarkMidBlue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(image: AssetImage("images/Avatar.png")),
                            buildWidth(context, 0.01),
                            Text(
                              item.reviewer2,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: "Sf",
                                color: kWhite,
                              ),
                            ),
                            Spacer(),
                            Image(
                              image: AssetImage("images/Frame 1462983574.png"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Text(
                          item.reviewerdescription2,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: "Sf",
                            color: kWhite,
                          ),
                        ),
                      ),
                      buildHeight(context, 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                        child: Text(
                          item.date,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            fontFamily: "Sf",
                            color: kWhiteOpacity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                buildHeight(context, 0.0001),
                GestureDetector(
                  onTap: () async {
                    final String mapUrl = item.url;

                    if (await canLaunch(mapUrl)) {
                      await launch(mapUrl);
                    } else {
                      // If the URL can't be launched, show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Could not open maps')),
                      );
                    }
                    ;
                  },
                  child: Container(
                    height: height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: kLightYellow,
                    ),
                    child: Center(
                      child: Text(
                        "Open map",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kDarkBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          fontFamily: "Sf",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceCard(String imagePath, String placeName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(child: Image.asset(imagePath)),
        buildHeight(context, 0.02),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            placeName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: "Sf",
              color: kWhite,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDashedLine() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          10,
          (index) => Container(
            width: 5,
            height: 2,
            margin: EdgeInsets.symmetric(horizontal: 3),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
