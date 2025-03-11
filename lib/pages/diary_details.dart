import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/utils/classes.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class DiaryDetails extends StatefulWidget {
  final Routee routee;

  const DiaryDetails({super.key, required this.routee});
  @override
  State<DiaryDetails> createState() => _DiaryDetailsState();
}

class _DiaryDetailsState extends State<DiaryDetails> {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeight(context, 0.02),

                //
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                    image: AssetImage(widget.routee.image),
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                buildHeight(context, 0.04),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [for (int i = 0; i < 1; i++) buildtexti(context)],
                  ),
                ),
                buildHeight(context, 0.01),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: kDarkMidBlue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeight(context, 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Text(
                          widget.routee.description,
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
                          widget.routee.date,
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
                      padding: const EdgeInsets.only(left: 12.0, right: 12),
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
                            "3h 40m",
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
                buildHeight(context, 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                  child: Text(
                    "Places",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: "Sf",
                      color: kWhite,
                    ),
                  ),
                ),
                Container(
                  height: height * 0.2, // Adjust the height of the list view
                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal, // Set the scroll direction to horizontal
                    itemCount: widget.routee.places.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // First Place
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        widget.routee.places[index].image[0],
                                        width: width * 0.35,
                                        height: height * 0.15,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.1,
                                      right: 0.1,
                                      child: Image.asset("images/alfa1.png"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ), // Space between image and text
                                Text(
                                  widget.routee.places[index].place1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: "Sf",
                                    color: kWhite,
                                  ), // Adjust text style as needed
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 70),
                              child: _buildDashedLine(),
                            ), // Dashed Line between places
                            // Second Place
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        widget.routee.places[index].image[1],
                                        width: width * 0.35,
                                        height: height * 0.15,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.1,
                                      right: 0.1,
                                      child: Image.asset("images/beta.png"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  textAlign: TextAlign.left,
                                  widget.routee.places[index].place2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: "Sf",
                                    color: kWhite,
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 70),
                              child: _buildDashedLine(),
                            ),

                            // Third Place
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        widget.routee.places[index].image[2],
                                        width: width * 0.35,
                                        height: height * 0.15,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.1,
                                      right: 0.1,
                                      child: Image.asset("images/ceta.png"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  widget.routee.places[index].place3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: "Sf",
                                    color: kWhite,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildtexti(BuildContext context) {
    return Text(
      widget.routee.places[0].heading, // Assuming you want the first place
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: "Sf",
        color: kWhite,
      ),
    );
  }

  Widget _buildDashedLine() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        10,
        (index) => Container(
          width: 5,
          height: 2,
          margin: EdgeInsets.symmetric(horizontal: 3),
          color: Colors.white,
        ),
      ),
    );
  }
}
