import 'package:devhub/application/presentation/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  /// Load saved theme preference
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    _applyTheme(isDarkMode.value);
  }

  /// Save the selected theme
  Future<void> _saveTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
  }

  /// Apply theme to app
  void _applyTheme(bool isDark) {
    Get.changeTheme(isDark ? AppThemes.darkTheme() : AppThemes.lightTheme());
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  /// Toggle between dark and light mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _applyTheme(isDarkMode.value);
    _saveTheme(isDarkMode.value);
  }
}
