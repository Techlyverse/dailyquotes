import 'package:dailyquotes/main.dart';
import 'package:flutter/material.dart';

class theme extends StatefulWidget {
  @override
  State<theme> createState() => _themestate();
}

class _themestate extends State<theme> {
  List<String> natureImages = [
    "assets/images/nature.jpg",
    "assets/images/plant.jpg",
    "assets/images/plant2.jpg",
    "assets/images/sky.jpg",
   
  ];

  List<String> gradientImages = [
    "assets/images/gradient1.jpg",
    "assets/images/gradient2.jpg",
    
  ];

  List<String> colourImages = [
    "assets/images/plain.png",
    "assets/images/plain2.png",
    
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Themes'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Nature'),
              Tab(text: 'Gradient'),
              Tab(text: 'Colour'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTab(natureImages),
            _buildTab(gradientImages),
            _buildTab(colourImages),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(List<String> images) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
           
              selectedImagePath = images[index];
             if (selectedImagePath != null) {
                            setState(() {
                              
                           });
             }
          
            
           
            
      Navigator.pop(context); 

          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
