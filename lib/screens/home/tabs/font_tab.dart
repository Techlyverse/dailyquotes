import 'package:dailyquotes/data/fonts.dart';
import 'package:dailyquotes/provider/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/theme.dart';

class FontTab extends StatelessWidget {
  const FontTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: fonts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 2.0,
      ),
      itemBuilder: (_, index) {
        return Consumer(builder: (context, ref, child) {
          return GestureDetector(
            onTap: () {
              ref.read(fontNotifierProvider.notifier).setFontIndex(index);
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isDark
                    ? darkTheme.colorScheme.surfaceContainerHighest
                    : Colors.grey.shade200,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  fonts[index].fontFamily?.split("_").first ?? "New Font",
                  style: fonts[index].copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
