import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

// Clasa LocationInfo acceptă un parametru 'item'
class LocationInfo extends StatefulWidget {
  final dynamic item;

  const LocationInfo({super.key, required this.item});

  @override
  State<LocationInfo> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
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
          "Place",
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
                      buildHeight(context, 0.02),
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
                            buildWidth(context, 0.017),
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
                            buildWidth(context, 0.017),
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
                buildHeight(context, 0.04),

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
                        "Open in maps ",
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
}
