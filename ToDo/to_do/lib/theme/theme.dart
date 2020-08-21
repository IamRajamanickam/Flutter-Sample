import 'package:flutter/material.dart';

class CustomTheme {
  static final Color whiteColor = hexToColor("#E3E3E9");
  static final Color blueColor = hexToColor("#3F51B5");

  static ThemeData lightTheme(BuildContext context) {
    final primaryColor = hexToColor("#327fc7"); //3F51B5// Color(0xff696b9e);
    final backgroundColor = Colors.white;
    return Theme.of(context).copyWith(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: primaryColor,
      primaryColorBrightness: Brightness.light,
      cursorColor: primaryColor,
      bottomAppBarColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: backgroundColor,
      dialogBackgroundColor: backgroundColor,
      backgroundColor: backgroundColor,
      accentColor: primaryColor,
      buttonColor: primaryColor,
      hintColor: primaryColor,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryColor,
        contentTextStyle: TextStyle(
          color: backgroundColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: AppBarTheme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
                headline1: TextStyle(
                  color: backgroundColor,
                  fontSize: 15,
                ),
                headline2: TextStyle(
                  color: backgroundColor,
                  fontSize: 20,
                ),
                subtitle1: TextStyle(
                  color: backgroundColor,
                ),
                subtitle2: TextStyle(
                  color: backgroundColor,
                ),
                bodyText1: TextStyle(
                  color: backgroundColor,
                ),
                bodyText2: TextStyle(
                  color: backgroundColor,
                ),
              )),
      iconTheme: IconThemeData(color: backgroundColor),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      buttonTheme: ButtonThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
                background: backgroundColor,
                surface: backgroundColor,
                onBackground: primaryColor,
                secondary: backgroundColor,
                onSecondary: backgroundColor,
                onPrimary: primaryColor,
                onSurface: primaryColor,
              )),
      textTheme: Theme.of(context).textTheme.copyWith(
            subtitle1: TextStyle(
              color: primaryColor,
            ),
            subtitle2: TextStyle(
              color: primaryColor,
            ),
            button: TextStyle(
              color: primaryColor,
            ),
            headline6: TextStyle(
              color: primaryColor,
            ),
            headline5: TextStyle(
              color: primaryColor,
            ),
            headline4: TextStyle(
              color: primaryColor,
            ),
            headline3: TextStyle(
              color: primaryColor,
            ),
            headline2: TextStyle(
              color: primaryColor,
            ),
            headline1: TextStyle(
              color: primaryColor,
            ),
            bodyText1: TextStyle(
              color: primaryColor,
            ),
            bodyText2: TextStyle(
              color: primaryColor,
            ),
          ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final primaryColor = hexToColor("#555259"); //Colors.black87;
    final backgroundColor =
        hexToColor("#FFFFFF"); //whiteColor; //Color(0xff696b9e);
    return Theme.of(context).copyWith(
      brightness: Brightness.dark,
      primaryColorBrightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: primaryColor,
      cursorColor: backgroundColor,
      toggleableActiveColor: backgroundColor,
      bottomAppBarColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      cardColor: primaryColor,
      dialogBackgroundColor: primaryColor,
      backgroundColor: primaryColor,
      accentColor: primaryColor,
      buttonColor: primaryColor,
      hintColor: backgroundColor,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryColor,
        contentTextStyle: TextStyle(
          color: backgroundColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(color: backgroundColor),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      buttonTheme: ButtonThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: backgroundColor,
              )),
      appBarTheme: AppBarTheme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
                headline1: TextStyle(
                  color: backgroundColor,
                  fontSize: 15,
                ),
                headline2: TextStyle(
                  color: backgroundColor,
                  fontSize: 20,
                ),
                subtitle1: TextStyle(
                  color: backgroundColor,
                ),
                subtitle2: TextStyle(
                  color: backgroundColor,
                ),
                bodyText1: TextStyle(
                  color: backgroundColor,
                ),
                bodyText2: TextStyle(
                  color: backgroundColor,
                ),
              )),
      textTheme: Theme.of(context).textTheme.copyWith(
            subtitle1: TextStyle(
              color: backgroundColor,
            ),
            subtitle2: TextStyle(
              color: backgroundColor,
            ),
            button: TextStyle(
              color: backgroundColor,
            ),
            headline6: TextStyle(
              color: backgroundColor,
            ),
            headline5: TextStyle(
              color: backgroundColor,
            ),
            headline4: TextStyle(
              color: backgroundColor,
            ),
            headline3: TextStyle(
              color: backgroundColor,
            ),
            headline2: TextStyle(
              color: backgroundColor,
            ),
            headline1: TextStyle(
              color: backgroundColor,
            ),
            bodyText1: TextStyle(
              color: backgroundColor,
            ),
            bodyText2: TextStyle(
              color: backgroundColor,
            ),
          ),
    );
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
