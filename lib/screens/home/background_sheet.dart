import 'package:dailyquotes/screens/home/tabs/color_tab.dart';
import 'package:dailyquotes/screens/home/tabs/font_tab.dart';
import 'package:dailyquotes/screens/home/tabs/gradient_tab.dart';
import 'package:dailyquotes/screens/home/tabs/image_tab.dart';
import 'package:flutter/material.dart';

class BackgroundSheet extends StatelessWidget {
  const BackgroundSheet({super.key});

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
                const Text("Background", style: TextStyle(fontSize: 20)),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          const TabBar(
            tabs: [
              Tab(text: 'Images'),
              Tab(text: 'Gradients'),
              Tab(text: 'Colors'),
              Tab(text: 'Fonts'),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                ImageTab(),
                GradientTab(),
                ColorTab(),
                FontTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
