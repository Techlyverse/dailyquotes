import 'package:dailyquotes/provider/bg_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/images.dart';

class ImageTab extends StatelessWidget {
  const ImageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (_, index) {
        return Consumer(builder: (context, ref, child) {
          return GestureDetector(
            onTap: () {
              ref.read(bgNotifierProvider.notifier).updateImage(images[index]);
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade100,
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  filterQuality: FilterQuality.none,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
