import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeCard extends StatelessWidget {
  List<String> imagePath = [
    "assets/images/nature.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: 10.0, // Horizontal spacing between cards
            runSpacing: 10.0, // Vertical spacing between rows
            children: [
              //TODO: create theme for card and make them reusable
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/nature.jpg",
                    height: 150,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/plant.jpg",
                    fit: BoxFit.cover,
                    height: 150,
                    width: 120,
                    // Replace with your image path
                  ),
                ),
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/plant2.jpg",
                    fit: BoxFit.cover, // Replace with your image path
                    height: 150,
                    width: 120,
                  ),
                ),
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/sky.jpg",
                    fit: BoxFit.cover, // Replace with your image path
                    height: 150,
                    width: 120,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
