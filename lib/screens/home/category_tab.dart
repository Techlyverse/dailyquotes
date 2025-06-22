import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/fonts.dart';
import '../settings/setting.dart';
import 'background_sheet.dart';
import 'package:dailyquotes/provider/font_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dailyquotes/preferences/preferences.dart';

class CategoryTab extends ConsumerWidget {
  const CategoryTab({super.key, required this.category});
  final String category;
  static final List<String> languages = Preferences.getLanguages();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Facts')
                .where('category', arrayContains: category)
                .where('language', isEqualTo: languages)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("An error occurred"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final quotes = snapshot.data!.docs;
                return PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white70,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              quotes[index]['quote'],
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
                                "- ${quotes[index]['author']}",
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
            }),
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
                icon: const Icon(Icons.settings_outlined),
              )
            ],
          ),
        ),
      ],
    );
  }
}
