import 'package:dailyquotes/preferences/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'font_provider.g.dart';

@riverpod
class FontNotifier extends _$FontNotifier {
  @override
  int build() => Preferences.getFont() ?? 0;

  Future<void> update(int index) async {
    state = index;
    await Preferences.saveFont(index);
  }
}
