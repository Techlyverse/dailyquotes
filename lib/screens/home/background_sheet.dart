import 'package:dailyquotes/data/data.dart';
import 'package:dailyquotes/preferences/preferences.dart';
import 'package:flutter/material.dart';

import '../../data/colors.dart';
import '../../data/gradients.dart';

class BackgroundSheet extends StatefulWidget {
  const BackgroundSheet({super.key, required this.onDismiss});
  final Function onDismiss;

  @override
  State<BackgroundSheet> createState() => _BackgroundSheetState();
}

class _BackgroundSheetState extends State<BackgroundSheet> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Background", style: TextStyle(fontSize: 20)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.close))
                ],
              ),
            ),
            TabBar(
              tabs: [
                Tab(text: 'Nature'),
                Tab(text: 'Gradient'),
                Tab(text: 'Colour'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildTab(images: images),
                  _buildTab(gradients: gradients),
                  _buildTab(colors: colors),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildTab({
    List<String>? images,
    List<Color>? colors,
    List<Gradient>? gradients,
  }) {
    int length = images?.length ?? gradients?.length ?? colors?.length ?? 0;
    return images != null || gradients != null || colors != null
        ? GridView.builder(
            padding: const EdgeInsets.all(15.0),
            itemCount: gradients != null ? gradients.length : length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
            ),
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  saveThemeSelection();
                  backgroundImage = images?[index];
                  backgroundGradient = gradients?[index];
                  backgroundColor = colors?[index];

                  Navigator.pop(context);
                  widget.onDismiss();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
              );
            },
          )
        : const SizedBox();
  }
}
