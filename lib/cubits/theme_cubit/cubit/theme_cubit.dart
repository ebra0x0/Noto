import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:Noto/constants.dart';

enum AppTheme { light, dark }

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.light);

  String getDeviceTheme(BuildContext context) {
    final themeDevice = MediaQuery.of(context).platformBrightness;
    if (themeDevice == Brightness.dark) {
      return "dark";
    } else {
      return "light";
    }
  }

  void toggleTheme() {
    if (state == AppTheme.light) {
      emit(AppTheme.dark);
      saveTheme('dark');
    } else {
      emit(AppTheme.light);
      saveTheme('light');
    }
  }

  void saveTheme(String theme) {
    Box box = Hive.box<String>(kThemeBox);
    box.put('theme', theme);
  }

  String? getStorageTheme() {
    Box<String>? themeBox = Hive.box<String>(kThemeBox);
    if (themeBox.get('theme') == 'dark') {
      return "dark";
    } else {
      return "light";
    }
  }

  void fetchTheme(BuildContext context) {
    String? storageTheme = getStorageTheme();
    if (storageTheme != null) {
      if (storageTheme == 'dark') {
        emit(AppTheme.dark);
      } else {
        emit(AppTheme.light);
      }
    } else {
      getDeviceTheme(context) == 'dark'
          ? emit(AppTheme.dark)
          : emit(AppTheme.light);
    }
  }
}
