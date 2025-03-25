import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Uri _url = Uri.parse(
    'https://www.termsfeed.com/live/5c53fe36-b8f3-4ea1-893b-2cdbb83cdffa',
  );

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: buildTextAppbar(context, "Settings"),
        backgroundColor: kDarkBlue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeight(context, 0.04),
                buildContainer(context, "Privacy policy", "images/alfa.png"),
                buildHeight(context, 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext context, String text, final String image) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kDarkMidBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: "Sf",
                    color: kWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: _launchUrl,
                  child: Container(
                    height: height * 0.035,
                    width: width * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kLightYellow,
                    ),
                    child: Center(
                      child: Text(
                        "Open",
                        style: TextStyle(
                          fontFamily: "Sf",
                          color: kDarkMidBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildHeight(context, 0.02),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image(image: AssetImage(image))],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
