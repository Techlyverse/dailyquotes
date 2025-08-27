import 'package:dailyquotes/data/quotes/en_quotes.dart';
import 'package:dailyquotes/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/fonts.dart';
import '../../models/quote.dart';
import '../../provider/category_provider.dart';
import '../../provider/font_provider.dart';

class CategorySelection extends ConsumerWidget {
  const CategorySelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final categories = getAllDistinctTags(enQuotes);
    final selectedCategory = ref.watch(categoryNotifierProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20, 8, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select a category",
                style: TextStyle(
                    fontSize: 20, color: isDark ? Colors.white : Colors.black),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10, 8, 0),
            child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 2.5,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = category == selectedCategory;
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(categoryNotifierProvider.notifier)
                          .setCategory(category);
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected
                            ? Colors.lightBlueAccent
                            : isDark
                                ? Colors.grey.shade800
                                : Colors.grey.shade200,
                      ),
                      child: Text(
                        category,
                        style: fonts[ref.watch(fontNotifierProvider)].copyWith(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  static List<String> getAllDistinctTags(List<Quote> quotes) {
    final tagSet = <String>{};
    for (var quote in quotes) {
      tagSet.addAll(quote.tags);
    }

    return tagSet.toList();
  }
}
