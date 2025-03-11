import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/diary_page.dart';
import 'package:hohensyburg_dortmund_places/pages/location_page.dart';
import 'package:hohensyburg_dortmund_places/pages/note_page.dart';
import 'package:hohensyburg_dortmund_places/pages/settings_page.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _select = 0;
  final Color _selected = kLightYellow; // Culoarea iconiței active

  final List<Widget> _pages = [
    LocationPage(),
    DiaryPage(),
    NotePage(),
    SettingsPage(),
  ];

  final List<String> _iconPaths = [
    "images/ic_round-place.png",
    "images/mdi_diary.png",
    "images/solar_library-bold.png",
    "images/mdi_settings.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: _pages[_select],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 50,
        ), // Higher position
        child: Container(
          height: 80, // ⬆ Makes the navbar taller
          decoration: BoxDecoration(
            color: kDarkMidBlue,
            borderRadius: BorderRadius.circular(24), // ⬆ Bigger rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ), // ⬆ Adds internal spacing
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_iconPaths.length, (index) {
              bool isSelected = _select == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _select = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(14), // ⬆ Larger icon button area
                  decoration: BoxDecoration(
                    color: isSelected ? _selected : Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    _iconPaths[index],
                    width: 36, // ⬆ Bigger icons
                    height: 36, // ⬆ Bigger icons
                    color: isSelected ? kDarkBlue : kGray,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
