import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:to_do/utils.dart';

class Widgets {
  static showSnackBar(BuildContext context, String message) {
    var width = MediaQuery.of(context).size.width;
    Flushbar(
      //title: '$completedToDo Completed',
      flushbarPosition: FlushbarPosition.TOP,
      isDismissible: true,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      maxWidth: Utils.isLargeScreen(context) ? width / 3.15 : null,
      margin: EdgeInsets.all(16),
      forwardAnimationCurve: Curves.linearToEaseOut,
      reverseAnimationCurve: Curves.linearToEaseOut,
      backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
      messageText: Text(
        message,
        style: Theme.of(context).snackBarTheme.contentTextStyle,
      ),
      icon: Icon(
        Icons.done,
      ),
      //leftBarIndicatorColor: CustomTheme.backgroundColor,
      duration: Duration(seconds: 1),
    )..show(context);
  }
}
