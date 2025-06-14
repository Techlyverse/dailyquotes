import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyquotes/data/fonts.dart';
import 'package:dailyquotes/provider/bg_provider.dart';
import 'package:dailyquotes/provider/font_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/setting.dart';
import 'background_sheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // because we are getting AsyncValue<int> from fontNotifierProvider there fore we can't use it directly -MG
    final fontAsync = ref.watch(fontNotifierProvider);

    return Container(
      decoration: ref.watch(bgNotifierProvider),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('quotes')
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
                                    quotes[index]['quotes'],
                                    textAlign: TextAlign.center,
                                    //style: fonts[ref.read(fontNotifierProvider)],
                                    style: fontAsync.when(
                                      data: (fontIndex) => fonts[fontIndex],
                                      loading: () => const TextStyle(fontSize: 20),
                                      error: (_, __) => const TextStyle(fontSize: 20, color: Colors.red),
                                    ),
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
          ),
        ),
      ),
    );
  }
}
