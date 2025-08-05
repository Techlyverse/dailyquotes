import 'package:dailyquotes/data/fonts.dart';
import 'package:dailyquotes/provider/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FontTab extends StatelessWidget {
  const FontTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: fonts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (_, index) {
        return Consumer(builder: (context, ref, child) {
          return GestureDetector(
            onTap: () {
              ref.read(fontNotifierProvider.notifier).setFontIndex(index);
              Navigator.pop(context);

            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "My Font",
                style: fonts[index],
              ),
            ),
          );
        });
      },
    );
  }
}
