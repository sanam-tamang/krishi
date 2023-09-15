

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeLocalDataSource {
  ThemeModeLocalDataSource._();
  static ThemeModeLocalDataSource get instance => ThemeModeLocalDataSource._();
  Future<void> saveTheme(ThemeMode theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
      await sharedPreferences.setString('themeData', theme.name);
    
  }

  Future<ThemeMode> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? stringTheme = sharedPreferences.getString('themeData');

    final theme =
        ThemeMode.values.firstWhereOrNull((mode) => mode.name == stringTheme);

    return theme ?? ThemeMode.light;
  }
}
