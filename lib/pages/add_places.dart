import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/add_succesful.dart';
import 'package:hohensyburg_dortmund_places/pages/basement.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class AddPlaces extends StatefulWidget {
  const AddPlaces({super.key});

  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final TextEditingController _headingcontroler = TextEditingController();
  final TextEditingController _descriptioncontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildtext(context, "Add places"),
              buildHeight(context, 0.02),
              buildContainerr(context),
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
                    CupertinoPageRoute(builder: (context) => AddSuccesful()),
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

  Widget buildContainerr(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kLightBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildtext(context, "Heading"),
            buildHeight(context, 0.02),
            buildField(
              context,
              "Text",
              kGray,
              kGray,
              controller: _headingcontroler,
            ),
            buildHeight(context, 0.02),

            buildtext(context, "Address"),
            buildHeight(context, 0.02),
            buildField(
              context,
              "Text",
              kGray,
              kGray,
              controller: _descriptioncontroler,
            ),
            buildHeight(context, 0.02),
            buildtext(context, "Cover"),
            buildHeight(context, 0.02),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: width * 0.35,
                height: height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kLightYellow,
                ),
                child: Center(
                  child: Icon(Icons.add, color: kDarkBlue, size: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
