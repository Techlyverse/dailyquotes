import 'package:dailyquotes/provider/bg_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/colors.dart';

class ColorTab extends StatelessWidget {
  const ColorTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: colors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (_, index) {
        return Consumer(builder: (context, ref, child) {
          return GestureDetector(
            onTap: () {
              ref.read(bgNotifierProvider.notifier).updateColor(index);
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colors[index],
              ),
            ),
          );
        });
      },
    );
  }
}
