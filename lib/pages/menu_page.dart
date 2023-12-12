import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/models/food.dart';

import '../theme/colors.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List foodMenu = [
    Food(
        name: "TteokBokki",
        imagePath: "lib/images/tteok.png",
        price: "21.00",
        rating: "4.8"),
    Food(
        name: "BudaeJjiage",
        imagePath: "lib/images/budae-jjigae.png",
        price: "30.00",
        rating: "4.4"),
    Food(
        name: "Bibimbap",
        imagePath: "lib/images/bibimbap.png",
        price: "22.00",
        rating: "4.9"),
    Food(
        name: "Gimbap",
        imagePath: "lib/images/gimbap.png",
        price: "17.00",
        rating: "4.9")
  ];

  void navigateToFoodDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: foodMenu[index],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Seoul',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get 40% Discount!!',
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyButton(text: "Redeem", onTap: () {}),
                    ],
                  ),
                  // redeem button
                  // image
                  Image.asset(
                    'lib/images/ramen.png',
                    height: 100,
                  )
                ]),
          ),

          const SizedBox(height: 25),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Search here..")),
          ),

          const SizedBox(
            height: 25,
          ),
          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),
          // popular food

          const SizedBox(
            height: 25,
          ),

          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            margin:
                const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // image
                Row(
                  children: [
                    Image.asset(
                      'lib/images/gimbap.png',
                      height: 60,
                    ),

                    const SizedBox(width: 20),

                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text("GimBap",
                            style: GoogleFonts.dmSerifDisplay(fontSize: 18)),

                        const SizedBox(
                          height: 10,
                        ),
                        // price
                        Text(
                          '\$17.00',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),

                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
