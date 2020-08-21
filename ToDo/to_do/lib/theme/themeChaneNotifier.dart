import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeChangeNotifier with ChangeNotifier {
  //
  bool isDarkModeOn =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

  void updateTheme(bool isDarkModeOn) {
    this.isDarkModeOn = isDarkModeOn;
    notifyListeners();
  }
}
