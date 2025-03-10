import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/add_places.dart';
import 'package:hohensyburg_dortmund_places/pages/basement.dart';
import 'package:hohensyburg_dortmund_places/pages/diary_add.dart';
import 'package:hohensyburg_dortmund_places/utils/classes.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/provider_app.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DiaryInfo extends StatefulWidget {
  @override
  State<DiaryInfo> createState() => _DiaryInfoState();
}

class _DiaryInfoState extends State<DiaryInfo> {
  File? _selectedImage; // Variabilă pentru imaginea aleasă

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Route? route;
  bool _isSave = false;

  final TextEditingController _headingcontroler = TextEditingController();
  final TextEditingController _descriptioncontroler = TextEditingController();
  final TextEditingController _datecontroler = TextEditingController();

  @override
  void initState() {
    super.initState();
    _headingcontroler.addListener(_updateSaveButtonState);
    _descriptioncontroler.addListener(_updateSaveButtonState);
    _datecontroler.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    _headingcontroler.dispose();
    _descriptioncontroler.dispose();
    _datecontroler.dispose();
    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      _isSave =
          _headingcontroler.text.isNotEmpty &&
          _descriptioncontroler.text.isNotEmpty &&
          _datecontroler.text.isNotEmpty;
    });
  }

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

                buildtext(context, "Description"),
                buildHeight(context, 0.02),
                buildField(
                  context,
                  "Text",
                  kGray,
                  kGray,
                  controller: _descriptioncontroler,
                ),
                buildHeight(context, 0.02),
                buildtext(context, "Date"),
                buildHeight(context, 0.02),

                buildField(
                  context,
                  "Date",
                  kGray,
                  kGray,
                  controller: _datecontroler,
                ),
                buildHeight(context, 0.02),
                buildtext(context, "Cover"),
                buildHeight(context, 0.02),
                GestureDetector(
                  onTap: _pickImage,
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
                buildHeight(context, 0.02),
                // Dacă _selectedImage este null, Container-ul nu va fi afișat deloc
                _selectedImage != null
                    ? Container(
                      width: double.infinity,
                      height: height * 0.20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:
                            kGray, // Culoare de fundal dacă nu este selectată nicio imagine
                        image: DecorationImage(
                          image: FileImage(_selectedImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    : SizedBox(), // Returnează un widget gol (nu afișează nimic)
                buildHeight(context, 0.01),
                GestureDetector(
                  onTap:
                      _isSave
                          ? () {
                            final provider = Provider.of<ProviderApp>(
                              context,
                              listen: false,
                            );
                            final good = Routee(
                              heading: _headingcontroler.text,
                              description: _descriptioncontroler.text,
                              date: _datecontroler.text,
                              image: _selectedImage?.path ?? '',
                            );
                            provider.addRoutee(good);
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => AddPlaces(),
                              ),
                            );
                          }
                          : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please complete all required fields.",
                                  style: TextStyle(fontFamily: "Sf"),
                                ),
                                backgroundColor: Color(0xffE5182B),
                              ),
                            );
                          },

                  child: Container(
                    width: double.infinity,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kLightYellow,
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontFamily: "Sf",
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: kDarkBlue,
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
