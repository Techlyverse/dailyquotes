import 'package:dailyquotes/data/fonts.dart';
import 'package:dailyquotes/provider/bg_provider.dart';
import 'package:dailyquotes/provider/font_provider.dart';
import 'package:dailyquotes/screens/home/category_tab.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/category_provider.dart';
import '../settings/setting.dart';
import 'background_sheet.dart';
import 'category_selection.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryNotifierProvider);

    return Container(
      decoration: ref.watch(bgNotifierProvider),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 40,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const CategorySelection(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white70, width: 2),
                        ),
                        child: Text(
                          selectedCategory ?? "No Category Selected",
                          style: fonts[ref.watch(fontNotifierProvider)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CategoryTab(
                  category: selectedCategory,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (context) => const BackgroundSheet(),
                        );
                      },
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.color_lens_outlined),
                    ),
                    const SizedBox(width: 15),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingScreen()));
                      },
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.settings_outlined),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getTextColor(BoxDecoration bg) {
    final bgColor = bg.color ?? Colors.transparent;
    if (bg.gradient != null) {
      final firstColor = bg.gradient!.colors.first;
      return ThemeData.estimateBrightnessForColor(firstColor) == Brightness.dark
          ? Colors.white
          : Colors.black;
    }
    if (bg.image != null) return Colors.white;
    return ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
        ? Colors.white
        : Colors.black;
  }
}
