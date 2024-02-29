import "package:dailyquotes/data/data.dart";

import "package:shared_preferences/shared_preferences.dart";
Future<void> saveThemeSelection() async {
    final prefs = await SharedPreferences.getInstance();
    if (backgroundImage != null) {
      await prefs.setString('backgroundImage', backgroundImage!);
    } else if (backgroundGradient != null) {
      
      final List<String> gradientColorStrings =
          backgroundGradient!.colors.map((color) => color.value.toString()).toList();
      await prefs.setStringList('backgroundGradient', gradientColorStrings);
    } else if (backgroundColor != null) {
      await prefs.setInt('backgroundColor', backgroundColor!.value);
    }
  }


  
  