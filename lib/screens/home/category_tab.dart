import 'package:dailyquotes/models/quotes.dart';
import 'package:dailyquotes/services/quote_data_processing.dart';
import 'package:flutter/material.dart';

import '../../data/fonts.dart';
import 'package:dailyquotes/provider/font_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dailyquotes/preferences/preferences.dart';


final likeProvider = StateProvider<bool>((ref) => false);

class CategoryTab extends ConsumerWidget {
  const CategoryTab({super.key, required this.category});
  final String? category;
  static final String language = Preferences.getLanguage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print("Languages passed: $language");
    //bool isLiked = ref.watch(likeProvider);

    return Stack(
      children: [
        FutureBuilder<List<Quote>>(
            future: quoteDataProcessing(),
            builder: (context, snapshot) {
              //print("Selected language: $language");
              //print("Selected category: $category");
              if (snapshot.hasError) {
                return const Center(child: Text("An error occurred"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final quotes = category != null ? snapshot.data!.where((quote) => quote.tags.contains(category)).toList() : snapshot.data!;
                //print("Quotes: $quotes");
                return PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child: IconButton(
                          //       onPressed:() {
                          //         ref.read(likeProvider.notifier).state = !isLiked;
                          //       },
                          //       icon: Icon(
                          //         isLiked ? Icons.favorite : Icons.favorite_border,
                          //         color: isLiked ? Colors.red : Colors.transparent,
                          //       )
                          //   ),
                          // ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white70,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              quotes[index].quote,
                              textAlign: TextAlign.center,
                              style: fonts[ref.watch(fontNotifierProvider)],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "- ${quotes[index].author}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  background: Paint()
                                    ..strokeWidth = 20
                                    ..color = Colors.black38
                                    ..strokeJoin = StrokeJoin.round
                                    ..strokeCap = StrokeCap.round
                                    ..style = PaintingStyle.stroke,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              }
            ),
        // Align(
        //   alignment: Alignment.bottomRight,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       IconButton(
        //         onPressed: () {
        //           showModalBottomSheet<void>(
        //             context: context,
        //             builder: (context) => const BackgroundSheet(),
        //           );
        //         },
        //         icon: const Icon(Icons.color_lens_outlined),
        //       ),
        //       const SizedBox(width: 15),
        //       IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const SettingScreen()));
        //         },
        //         icon: const Icon(Icons.settings_outlined),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
