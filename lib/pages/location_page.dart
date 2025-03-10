import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hohensyburg_dortmund_places/pages/location_info.dart';
import 'package:hohensyburg_dortmund_places/utils/provider_app.dart';
import 'package:provider/provider.dart';
import 'package:hohensyburg_dortmund_places/utils/colors.dart';
import 'package:hohensyburg_dortmund_places/utils/text.dart';

class LocationPage extends StatefulWidget {
  LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: buildTextAppbar(context, "Hohensyburg places"),
        backgroundColor: kDarkBlue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Lista de clase cu scroll pe orizontală
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard("Attractions", 0, context),
                    _buildCategoryCard("Restaurants and Cafés", 1, context),
                    _buildCategoryCard("Entertainment", 2, context),
                    _buildCategoryCard("Recreation", 3, context),
                  ],
                ),
              ),
              buildHeight(context, 0.04),

              // Afișarea detaliilor pentru clasa selectată
              Expanded(
                child: Consumer<ProviderApp>(
                  builder: (context, locationProvider, _) {
                    // Listă de liste pentru a accesa direct
                    List<List<dynamic>> categories = [
                      locationProvider.attractions,
                      locationProvider.restaurants,
                      locationProvider.entertainment,
                      locationProvider.recreation,
                    ];

                    // Verifică dacă indexul selectat este valid
                    if (locationProvider.selectedIndex >= 0 &&
                        locationProvider.selectedIndex < categories.length) {
                      // Print pentru a verifica datele din lista aleasă
                      print(
                        "Selected Index: ${locationProvider.selectedIndex}",
                      );
                      print(
                        "Data in selected category: ${categories[locationProvider.selectedIndex]}",
                      );

                      if (categories[locationProvider.selectedIndex].isEmpty) {
                        print("The selected category list is empty");
                      }
                      return _buildDetails(
                        categories[locationProvider.selectedIndex],
                      );
                    } else {
                      print("No valid category selected");
                      return Center(child: Text('No category selected'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, int index, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    bool isSelected = context.watch<ProviderApp>().selectedIndex == index;

    return GestureDetector(
      onTap: () {
        context.read<ProviderApp>().setSelectedIndex(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color:
              context.watch<ProviderApp>().selectedIndex == index
                  ? kLightYellow
                  : kLightBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color:
                  isSelected ? Colors.black : Colors.white, // Change text color
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(List<dynamic> list) {
    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true, // Permite GridView să ocupe doar spațiul necesar
        physics:
            NeverScrollableScrollPhysics(), // Dezactivează scroll-ul intern al GridView
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Numărul de coloane în grid
          crossAxisSpacing: 5.0, // Spațiu orizontal între elemente
          mainAxisSpacing: 5.0, // Spațiu vertical între elemente
          childAspectRatio: 1.55,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final height = MediaQuery.of(context).size.height;

          var item = list[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => LocationInfo(item: item),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagine
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: height * 0.22,
                  ),
                ),
                // Titlu
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 10,
                  ), // Reducerea padding-ului pentru titlu
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
      ),
    );
  }
}
