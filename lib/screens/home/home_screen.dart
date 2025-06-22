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
    return Container(
      decoration: ref.watch(bgNotifierProvider),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, top: 40, right: 20, bottom: 20),
          child: DefaultTabController(
            length: categories.length,
            child: Column(
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
                Expanded(
                    child: TabBarView(children: [
                  CategoryTab(
                    category: 'Horror',
                  ),
                  CategoryTab(
                    category: 'Comedy',
                  ),
                  CategoryTab(
                    category: 'Romance',
                  ),
                  CategoryTab(
                    category: 'Love',
                  ),
                ])),
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
