import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/utils/provider_app.dart';
import 'package:provider/provider.dart';
import 'package:hohensyburg_dortmund_places/pages/note_info.dart';
import 'package:hohensyburg_dortmund_places/utils/classes.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class NotePage extends StatefulWidget {
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    // Obține datele din Provider
    final libraryProvider = Provider.of<ProviderApp>(context);
    final libraryList = libraryProvider.library;

    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kDarkBlue,
        centerTitle: false,
        title: buildTextAppbar(context, "Ways library"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeight(context, 0.02),
              Expanded(child: _buildDetails(libraryList)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(List<Library> list) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1.55,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        var item = list[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => NoteInfo(item: item)),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10),
                child: Text(
                  item.title,
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
        );
      },
    );
  }
}
