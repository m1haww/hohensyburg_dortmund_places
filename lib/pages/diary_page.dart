import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/diary_details.dart';
import 'package:hohensyburg_dortmund_places/pages/diary_info.dart';
import 'package:hohensyburg_dortmund_places/utils/classes.dart';
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
  @override
  Widget build(BuildContext context) {
    final routeeList = Provider.of<ProviderApp>(context).routee;

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
            // Check if the list is empty and display a message
            if (routeeList.isEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "You haven't added anything yet.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: "Sf",
                    color: kWhite,
                  ),
                ),
              ),
            // ListView to display Routee objects
            if (routeeList.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: routeeList.length,
                  itemBuilder: (context, index) {
                    final routeeItem = routeeList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder:
                                (context) => DiaryDetails(routee: routeeItem),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                routeeItem.image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 180,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 10,
                              ),
                              child: Text(
                                routeeItem.heading,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  fontFamily: "Sf",
                                  color: kWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: width * 0.35,
        height: height * 0.07,
        child: FloatingActionButton(
          backgroundColor: kLightYellow,
          onPressed: () async {
            final result = await Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => DiaryInfo()),
            );

            if (result != null && result is Routee) {
              setState(() {
                routeeList.add(result); // Add the new Routee to the list
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
