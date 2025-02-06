import "package:shared_preferences/shared_preferences.dart";

class Preferences {
  const Preferences._();

  static const String _gradientIndex = "gradientIndex";
  static const String _colorIndex = "colorIndex";
  static const String _imageUrl = "imageUrl";

  static late final SharedPreferences _prefs;

  static Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveGradientIndex(int index) async {
    return await _prefs.setInt(_gradientIndex, index);
  }

  static int? getGradientIndex() {
    return _prefs.getInt(_gradientIndex);
  }

  static Future<bool> removeGradient() {
    return _prefs.remove(_gradientIndex);
  }

  static Future<bool> saveColorIndex(int index) async {
    return await _prefs.setInt(_colorIndex, index);
  }

  static int? getColorIndex() {
    return _prefs.getInt(_colorIndex);
  }

  static Future<bool> removeColor() {
    return _prefs.remove(_colorIndex);
  }

  static Future<bool> saveImageUrl(String url) async {
    return await _prefs.setString(_imageUrl, url);
  }

  static String? getImageUrl() {
    return _prefs.getString(_imageUrl);
  }

  static Future<bool> removeImageUrl() {
    return _prefs.remove(_imageUrl);
  }
}
