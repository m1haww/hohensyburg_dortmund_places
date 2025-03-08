import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      centerTitle: false,
title: buildTextAppBar(context, "Hohensyburg places"),
    ),
    body: SafeArea(child: Column(
      children: [

      ],
    )),
    );
  }
}