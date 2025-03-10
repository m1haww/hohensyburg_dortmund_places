import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/basement.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class AddSuccesful extends StatefulWidget {
  final Map<String, String> places;

  const AddSuccesful({super.key, required this.places});

  @override
  State<AddSuccesful> createState() => _AddSuccesfulState();
}

class _AddSuccesfulState extends State<AddSuccesful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeight(context, 0.15),
            Center(
              child: Text(
                "Way is successfully \n added",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Sf",
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: kWhite,
                ),
              ),
            ),
            buildHeight(context, 0.02),
            Center(
              child: Image(
                image: AssetImage("images/------ (4) 1.png"),
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  // Create a map of the data you want to pass back
                  Map<String, String> placeData = {
                    'heading': widget.places['heading'] ?? '',
                    'place1': widget.places['place1'] ?? '',
                    'place2': widget.places['place2'] ?? '',
                    'place3': widget.places['place3'] ?? '',
                    'image1': widget.places['image1'] ?? '',
                    'image2': widget.places['image2'] ?? '',
                    'image3': widget.places['image3'] ?? '',
                  };

                  // Pass the data back to the previous page
                  Navigator.pop(context, placeData);
                  Navigator.pop(
                    context,
                    placeData,
                  ); // Pop the second context if needed
                  Navigator.pop(
                    context,
                    placeData,
                  ); // Pop the first context if needed
                },
                child: buildContainer(context, "Close"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
