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

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
   final List<String> categories = ["Horror", "Comedy", "Romance", "Love"];
  late List<String> languages = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Container(
      decoration: ref.watch(bgNotifierProvider),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left : 20.0, top: 40, right: 20, bottom: 20 ),
          child: DefaultTabController(
            length: categories.length,
            child:  Column(
              children: [
                TabBar(tabs: [
                  Tab(text: 'Horror'),
                  Tab(text: 'Comedy'),
                  Tab(text: 'Romance'),
                  Tab(text: 'Love'),
                  // for (var i in categories){
                  //   Tab(text: i),
                  // }
                ]),
                Expanded(child: TabBarView(children: [
                  CategoryTab( category: 'Horror',),
                  CategoryTab(category: 'Comedy',),
                  CategoryTab(category: 'Romance',),
                  CategoryTab(category: 'Love',),
                ])),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getLanguage()async {
    final langList = await FirebaseFirestore.instance.collection('languages').get();
    for(var lang in langList.docs){
      languages.add(lang['language']);
    }
  }
}
