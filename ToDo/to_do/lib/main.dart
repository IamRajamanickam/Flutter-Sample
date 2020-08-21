import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do/pages/todo.dart';
import 'package:to_do/theme/theme.dart';
import 'package:to_do/theme/themeChaneNotifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChangeNotifier()),
      ],
      child: ToDo(),
    ),
  );
}

class ToDo extends StatelessWidget {
  const ToDo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme(context),
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: context.watch<ThemeChangeNotifier>().isDarkModeOn
          ? ThemeMode.dark
          : ThemeMode.light,
      title: 'ToDo',
      home: HomePage(),
      // home: AnimatedSplashScreen(
      //   duration: 1000,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   splash: 'assets/todo_icon.png',
      //   nextScreen: HomePage(),
      // ),
    );
  }
}
