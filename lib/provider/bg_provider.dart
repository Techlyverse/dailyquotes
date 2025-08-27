import 'package:dailyquotes/data/colors.dart';
import 'package:dailyquotes/data/gradients.dart';
import 'package:dailyquotes/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bg_provider.g.dart';

@riverpod
class BgNotifier extends _$BgNotifier {
  @override
  BoxDecoration build() {
    final colorIndex = Preferences.getColorIndex();
    final gradientIndex = Preferences.getGradientIndex();
    final imageUrl = Preferences.getImageUrl();

    if (colorIndex != null || gradientIndex != null || imageUrl != null) {
      return BoxDecoration(
        color: colorIndex != null ? colors[colorIndex] : null,
        gradient: gradientIndex != null ? gradients[gradientIndex] : null,
        image: imageUrl != null
            ? DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover)
            : null,
      );
    }

    return BoxDecoration(color: colors[0]);
  }

  Future<void> updateColor(int index) async {
    state = BoxDecoration(color: colors[index]);
    await Future.wait([
      Preferences.saveColorIndex(index),
      Preferences.removeGradient(),
      Preferences.removeImageUrl(),
    ]);
  }

  Future<void> updateGradient(int index) async {
    state = BoxDecoration(gradient: gradients[index]);
    await Future.wait([
      Preferences.removeColor(),
      Preferences.saveGradientIndex(index),
      Preferences.removeImageUrl(),
    ]);
  }

  Future<void> updateImage(String imageUrl) async {
    state = BoxDecoration(
      image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
    );
    await Future.wait([
      Preferences.removeColor(),
      Preferences.removeGradient(),
      Preferences.saveImageUrl(imageUrl),
    ]);
  }
}
