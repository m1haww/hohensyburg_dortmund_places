import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/basement.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class AddSuccesful extends StatefulWidget {
  // final Map<String, String> places;

  const AddSuccesful({super.key});

  @override
  State<AddSuccesful> createState() => _AddSuccesfulState();
}

class _AddSuccesfulState extends State<AddSuccesful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: SafeArea(
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: GestureDetector(
                  onTap: () {
                    // Pass the data back to the previous page
                    Navigator.pop(context);
                    Navigator.pop(context); // Pop the second context if needed
                    Navigator.pop(context); // Pop the first context if needed
                  },
                  child: buildContainer(context, "Close"),
                ),
              ),
              buildHeight(context, 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
