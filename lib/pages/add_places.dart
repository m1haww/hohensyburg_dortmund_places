import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/add_succesful.dart';
import 'package:hohensyburg_dortmund_places/pages/basement.dart';
import 'package:hohensyburg_dortmund_places/utils/classes.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/provider_app.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPlaces extends StatefulWidget {
  const AddPlaces({super.key});

  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  File? _selectedImage2; // Variabilă pentru imaginea aleasă
  List<File> _selectedImages = []; // List to store selected images
  bool _isSave = false;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (_selectedImages.length < 3) {
          _selectedImages.add(File(pickedFile.path));
        }
      });
    }
  }

  void _validateAndProceed() {
    // Check if all 3 images have been selected
    if (_selectedImages.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Don't forget to put three images for your addresses!"),
        ),
      );
      return;
    }

    // Check if all fields are completed
    if (_headingcontroler.text.isEmpty ||
        _adress1controler.text.isEmpty ||
        _adress2controler.text.isEmpty ||
        _adress3controler.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill in all the fields!")));
      return;
    }

    // Access images from the list
    final image1 = _selectedImages[0].path;
    final image2 = _selectedImages[1].path;
    final image3 = _selectedImages[2].path;

    // Create a new Places object with the images
    final provider = Provider.of<ProviderApp>(context, listen: false);
    final newPlace = Places(
      heading: _headingcontroler.text,
      place1: _adress1controler.text,
      place2: _adress2controler.text,
      place3: _adress3controler.text,
      image1: image1,
      image2: image2,
      image3: image3,
    );
    final places = {
      'heading': _headingcontroler.text,
      'address1': _adress1controler.text,
      'address2': _adress2controler.text,
      'address3': _adress3controler.text,
      'image1': _selectedImages[0].path,
      'image2': _selectedImages[1].path,
      'image3': _selectedImages[2].path,
    };
    // Use the provider to add the new place if needed
    provider.addPlaces(newPlace);

    // Navigate to the AddSuccesful page
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => AddSuccesful(places: places)),
    );
  }

  @override
  void initState() {
    super.initState();
    _headingcontroler.addListener(_updateSaveButtonState);
    _adress1controler.addListener(_updateSaveButtonState);
    _adress2controler.addListener(_updateSaveButtonState);
    _adress3controler.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    _headingcontroler.dispose();
    _adress1controler.dispose();
    _adress2controler.dispose();
    _adress3controler.dispose();

    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      _isSave =
          _headingcontroler.text.isNotEmpty &&
          _adress1controler.text.isNotEmpty &&
          _adress2controler.text.isNotEmpty &&
          _adress3controler.text.isNotEmpty;
    });
  }

  Places? places;
  final TextEditingController _headingcontroler = TextEditingController();
  final TextEditingController _adress1controler = TextEditingController();
  final TextEditingController _adress2controler = TextEditingController();
  final TextEditingController _adress3controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderApp>(context);
    final lastRoutee = provider.routee.isNotEmpty ? provider.routee.last : null;
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
          child: SingleChildScrollView(
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
                buildHeight(context, 0.04),
                GestureDetector(
                  onTap: _validateAndProceed,
                  child: buildContainer(context, "Next"),
                ),
              ],
            ),
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
              kWhite,
              kGray,
              controller: _headingcontroler,
            ),
            buildHeight(context, 0.02),
            //1
            buildtext(context, "Address"),
            buildHeight(context, 0.02),
            buildField(
              context,
              "Text",
              kWhite,
              kGray,
              controller: _adress1controler,
            ), //2
            buildHeight(context, 0.02),

            buildtext(context, "Address"),
            buildHeight(context, 0.02),
            buildField(
              context,
              "Text",
              kWhite,
              kGray,
              controller: _adress2controler,
            ),
            buildHeight(context, 0.02),

            buildtext(context, "Address"),
            buildHeight(context, 0.02),
            buildField(
              context,
              "Text",
              kWhite,
              kGray,
              controller: _adress3controler,
            ),
            buildHeight(context, 0.02),
            buildtext(context, "Cover"),
            buildHeight(context, 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  _selectedImages.map((image) {
                    return image != null
                        ? Container(
                          width: width * 0.27,
                          height: height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kGray,
                            image: DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        : SizedBox.shrink();
                  }).toList(),
            ),
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
          ],
        ),
      ),
    );
  }
}
