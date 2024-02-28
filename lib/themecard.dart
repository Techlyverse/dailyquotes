import 'package:dailyquotes/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class theme extends StatefulWidget {
  final Function onDismiss;

  const theme({Key? key, required this.onDismiss}) : super(key: key);
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

  List<List<Color>> gradientColors = [
    [const Color(0xFF36D1DC), const Color(0xFF5B86E5)],
    [const Color(0xFFCC2B5E), const Color(0xFF753A88)],
    [const Color(0xFFff9966), const Color(0xFFff5e62)],
    [const Color(0xFFf2a0a1), const Color(0xFFece9e6)],
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
            _buildTab([], gradients: gradientColors),
            _buildTab(colourImages),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(List<String> images, {List<List<Color>>? gradients}) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: gradients != null ? gradients.length : images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            if (gradients != null) {
              setState(() {
                backgroundGradient = gradients[index];
               
                print(gradients[index]);
              });
            } else if (selectedImagePath != null) {
              setState(() {
                selectedImagePath = images[index];
                backgroundImage = selectedImagePath;
                print('Selected Image Path: $selectedImagePath');
                print('Background Image: $backgroundImage');
              });
            }
            saveGradientColors(backgroundGradient);
            saveBackgroundImage(selectedImagePath);
            Navigator.pop(context);
            widget.onDismiss();
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: gradients != null
                  ? Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradients[index],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    )
                  : Image.asset(
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

Future<void> saveBackgroundImage(String imagePath) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('myImage', imagePath);
}

Future<void> saveGradientColors(List<Color> gradientColors) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('selectedGradientColors',
      gradientColors.map((color) => color.value.toString()).toList());
}
