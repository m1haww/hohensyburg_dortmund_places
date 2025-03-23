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
                    ],
                  ),
                ),

                // Replace the review sections with "Details" or any other section name you prefer
                Padding(
                  padding: EdgeInsets.all(height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Details", // Change the title to something like "Details" or any section name
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: "Sf",
                          color: kWhite,
                        ),
                      ),
                      buildHeight(context, 0.01),
                      // Add custom content here to display additional information, not reviews
                      Text(
                        "Discover more about this place, including its history, cultural significance, or other interesting facts.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "Sf",
                          color: kWhite,
                        ),
                      ),
                      buildHeight(context, 0.02),
                      Text(
                        "Did you know? This place is famous for its architectural beauty, attracting visitors from all over the world.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "Sf",
                          color: kWhite,
                        ),
                      ),
                      buildHeight(context, 0.02),
                      Text(
                        "Visitors can also enjoy nearby attractions such as museums, parks, and historical landmarks.",
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
