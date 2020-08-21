import 'package:flutter/material.dart';

class Utils {
  static bool isLargeScreen(BuildContext context) {
    bool isLargeScreen = true;
    var width = MediaQuery.of(context).size.width;
    if (width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }
    return isLargeScreen;
  }

  static coverScreenWidth(double width) {
    bool isLargeScreen = true;
    if (width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }

    if (isLargeScreen) {
      SizedBox(
        width: width / 3,
      );
    } else
      Container();
  }

  static List<String> getTestToDo() {
    return List.generate(50, (index) => 'Test ToDo ${index + 1} ');
  }
}
