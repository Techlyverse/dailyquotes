import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyquotes/data/fonts.dart';
import 'package:dailyquotes/preferences/preferences.dart';
import 'package:dailyquotes/provider/bg_provider.dart';
import 'package:dailyquotes/provider/font_provider.dart';
import 'package:dailyquotes/screens/home/category_tab.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/setting.dart';
import 'background_sheet.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<String> categories = [];
  List<String> languages = [];


  @override
  void initState() {
    super.initState();
    getAppInfo();
  }


  @override
  Widget build(BuildContext context) {
    final bg = ref.watch(bgNotifierProvider);
    final textColor = getTextColor(bg);

    return Container(
      decoration: ref.watch(bgNotifierProvider),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, top: 40, right: 20, bottom: 20),
          child: DefaultTabController(
            length: 6,
            child: Column(
              children: [
                Container(
                  height: 60,
                  child: TabBar(
                    isScrollable: true,
                      labelColor: textColor,
                      labelStyle: fonts[ref.watch(fontNotifierProvider)],
                      unselectedLabelColor: textColor,
                      tabs: const [
                    Tab(text: 'Dark',),
                    Tab(text: 'Philosophical'),
                    Tab(text: 'Comedy'),
                    Tab(text: 'Motivational'),
                    Tab(text: 'Horror'),
                    Tab(text: 'Facts'),
                    // for (var i in categories){
                    //   Tab(text: i),
                    // }
                  ]),
                ),
                const Expanded(
                    child: TabBarView(children: [
                  CategoryTab(
                    category: 'Dark',
                  ),
                  CategoryTab(
                    category: 'Philosophical',
                  ),
                  CategoryTab(
                    category: 'Comedy',
                  ),
                  CategoryTab(
                    category: 'Motivational',
                  ),
                  CategoryTab(category: 'Horror'),
                  CategoryTab(category: 'Facts'),
                ])),

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
      ),
    );
  }

  // Future<void> getLanguage()async {
  //   final langList = await FirebaseFirestore.instance.collection('languages').get();
  //   for(var lang in langList.docs){
  //     languages.add(lang['language']);
  //   }
  // }

  Color getTextColor(BoxDecoration bg){
    final bgColor = bg.color ?? Colors.transparent;
    if(bg.gradient != null) {
      final firstColor = bg.gradient!.colors.first;
      return ThemeData.estimateBrightnessForColor(firstColor) == Brightness.dark ? Colors.white : Colors.black;
    }
    if(bg.image != null) return Colors.white;
    return ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark ? Colors.white : Colors.black;
  }

  Future<void> getAppInfo() async {
    try {
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('app_info')
          .doc('info')
          .get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        languages = List.from(data['languages']);
        categories = List.from(data['categories']);
      } else {
        throw Exception("Document does not exist.");
      }
    } catch (e) {
      print("Error getting languages: $e");
    }
  }
}
