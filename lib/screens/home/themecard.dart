import 'package:dailyquotes/data/data.dart';
import 'package:flutter/material.dart';

class theme extends StatefulWidget {
  final Function onDismiss;

  const theme({Key? key, required this.onDismiss}) : super(key: key);
  @override
  State<theme> createState() => _themestate();
}

class _themestate extends State<theme> {
  final List<String> images = [
    "assets/images/nature.jpg",
    "assets/images/plant.jpg",
    "assets/images/plant2.jpg",
    "assets/images/sky.jpg",
  ];

  final List<Gradient> gradients = [
    const LinearGradient(colors: [Color(0xFF36D1DC), Color(0xFF5B86E5)]),
    const RadialGradient(colors: [Color(0xFFCC2B5E), Color(0xFF753A88)]),
    const LinearGradient(colors: [Color(0xFFff9966), Color(0xFFff5e62)]),
    const LinearGradient(colors: [Color(0xFFf2a0a1), Color(0xFFece9e6)]),
  ];

  final List<Color> colors = [
    const Color(0xFF5B86E5),
    const Color(0xFFCC2B5E),
    const Color(0xFF753A88),
    const Color(0xFFff9966),
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
            _buildTab(images: images),
            _buildTab(gradients: gradients),
            _buildTab(colors: colors),
          ],
        ),
      ),
    );
  }

  Widget _buildTab({
    List<String>? images,
    List<Color>? colors,
    List<Gradient>? gradients,
  }) {
    int length = images?.length ?? gradients?.length ?? colors?.length ?? 0;
    return images != null || gradients != null || colors != null
        ? GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: gradients != null ? gradients.length : length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  backgroundImage = images?[index];
                  backgroundGradient = gradients?[index];
                  backgroundColor = colors?[index];

                  // if (gradients != null) {
                  //   setState(() {
                  //     backgroundGradient = gradients[index];
                  //
                  //     print(gradients[index]);
                  //   });
                  // } else if (selectedImagePath != null) {
                  //   setState(() {
                  //     selectedImagePath = images[index];
                  //     backgroundImage = selectedImagePath;
                  //     print('Selected Image Path: $selectedImagePath');
                  //     print('Background Image: $backgroundImage');
                  //   });
                  // }
                  // saveGradientColors(backgroundGradient);
                  // saveBackgroundImage(selectedImagePath);

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
                    child: Container(
                      decoration: BoxDecoration(
                          color: colors?[index],
                          gradient: gradients?[index],
                          image: images?[index] != null
                              ? DecorationImage(
                                  image: AssetImage(images![index]),
                                  filterQuality: FilterQuality.none,
                                  fit: BoxFit.cover,
                                )
                              : null),
                    ),
                  ),
                ),
              );
            },
          )
        : const SizedBox();
  }
}

// Future<void> saveBackgroundImage(String imagePath) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString('myImage', imagePath);
// }
//
// Future<void> saveGradientColors(List<Color> gradientColors) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setStringList('selectedGradientColors', gradientColors.map((color) => color.value.toString()).toList());
// }
