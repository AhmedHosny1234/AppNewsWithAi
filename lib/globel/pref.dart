import 'package:flutter/material.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
  static late Box _box;
  static Future<void> inatialize() async {
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    _box = Hive.box(name: 'newsAppData');
  }

  static bool get showHelloScreen =>
      _box.get('showHelloScreen', defaultValue: true);
  static set showHelloScreen(bool value) => _box.put('showHelloScreen', value);

  static String get language => _box.get('language', defaultValue: 'en');
  static set language(String value) => _box.put('language', value);

  static List<String> get selectedItems {
    final List<dynamic> rawList =
        _box.get('selectedItems', defaultValue: <String>[]) ?? [];
    return rawList.map((item) => item.toString()).toList();
  }

  static set selectedItems(List<String> items) {
    _box.put('selectedItems', items);
  }

  static bool get isDarkMode => _box.get('isDarkMode', defaultValue: false);
  static set isDarkMode(bool value) => _box.put('isDarkMode', value);

  static ThemeMode defaultTheme() {
    final bool isDarkMode = _box.get('isDarkMode', defaultValue: false);
    if (isDarkMode) {
      isDarkMode1 = true;
      return ThemeMode.dark;
    } else {
      isDarkMode1 = false;
      return ThemeMode.light;
    }
  }
}
