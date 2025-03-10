import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/basement.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class AddSuccesful extends StatefulWidget {
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
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
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
