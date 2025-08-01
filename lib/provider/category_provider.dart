import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../preferences/preferences.dart';

part 'category_provider.g.dart';

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  @override
  String? build() => Preferences.getCategory();

  Future<void> setCategory(String? category) async {
    state = category;
    await Preferences.saveCategory(category!);
  }
}