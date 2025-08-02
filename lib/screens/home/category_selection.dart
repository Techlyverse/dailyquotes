import 'package:dailyquotes/screens/home/category_tab.dart';
import 'package:dailyquotes/services/quote_data_processing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/fonts.dart';
import '../../models/quotes.dart';
import '../../provider/category_provider.dart';
import '../../provider/font_provider.dart';

class CategorySelection extends ConsumerWidget {
  const CategorySelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return FutureBuilder(
        future: quoteDataProcessing(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return const Center(child: Text("An error occurred"));
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }

          final quotes = snapshot.data!;
          final categories = Quote.getAllDistinctTags(quotes);
          final selectedCategory = ref.watch(categoryNotifierProvider);
          print("Categories: ${categories.length}");

          return Column(
            children: [
              const SizedBox(height: 30,),
              Text("Select a category", style: TextStyle(fontSize: 22, color: isDark? Colors.white : Colors.black),),
              const SizedBox(height: 30,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10, 8, 0),
                  child: GridView.builder(
                      itemCount: categories.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final isSelected = category== selectedCategory;
                        return GestureDetector(
                          onTap: () async {
                            await ref.read(categoryNotifierProvider.notifier).setCategory(category);
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isSelected? Colors.lightBlueAccent : isDark? Colors.white: Colors.grey.shade200,
                            ),
                            child: Center(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(category.toUpperCase(), style: fonts[ref.watch(fontNotifierProvider)], textAlign: TextAlign.center, softWrap: true, maxLines: 3,),
                            )),
                          ),
                        );
                      }
                  ),
                ),
              )
            ],
          );

        }
    );
  }
}

