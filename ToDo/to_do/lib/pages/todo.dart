import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/db/db_provider.dart';
import 'package:to_do/pages/completed_todo.dart';
import 'package:to_do/pages/widgets.dart';
import 'package:to_do/theme/theme.dart';
import 'package:to_do/theme/themeChaneNotifier.dart';
import 'package:to_do/utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String pendingToDo_Key = 'pending_todo';
  static const String completedToDo_Key = 'completed_todo';
  List<String> todoList = List.empty(growable: true);
  List<String> pendingTodoList = List.empty(growable: true);
  List<String> testTodoList = List.empty(growable: true);
  List<String> completedTodoList = List.empty(growable: true);

  Future<List> ftodoList;
  Future<List> fpendingTodoList;
  Future<List> ftestTodoList;
  Future<List> fcompletedTodoList;

  @override
  void initState() {
    print('Initit..');
    super.initState();
    print('Initit DBHandler..');
    fpendingTodoList = DBHandler().loadData(pendingToDo_Key);
    fcompletedTodoList = DBHandler().loadData(completedToDo_Key);

    fpendingTodoList.then((value) {
      print('Todo length=$value.length');
      setState(() {
        todoList = value;
      });
    });

    fcompletedTodoList.then((value) {
      setState(() {
        completedTodoList = value;
      });
    });
    print('Initit end..');
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        padding: Utils.isLargeScreen(context)
            ? EdgeInsets.only(left: width / 3, right: width / 3)
            : null,
        child: Row(
          children: [
            Flexible(
              child: Container(
                decoration: Utils.isLargeScreen(context)
                    ? BoxDecoration(
                        border: Border.all(color: CustomTheme.whiteColor),
                      )
                    : null,
                child: Scaffold(
                  body: CustomScrollView(
                    slivers: [
                      buildSliverAppBar(),
                      SliverPadding(padding: EdgeInsets.all(8.0)),
                      SliverFixedExtentList(
                          itemExtent: 60,
                          delegate: SliverChildBuilderDelegate(
                            _buildList,
                            childCount: todoList.length,
                          )),
                    ],
                  ),
                  bottomNavigationBar: buildBottomAppBar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      // pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 60,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Let\'s Do",
                style: Theme.of(context).appBarTheme.textTheme.headline1),
            IconButton(
              padding: EdgeInsets.only(bottom: 5),
              icon: context.watch<ThemeChangeNotifier>().isDarkModeOn
                  ? Icon(
                      Icons.wb_sunny,
                    )
                  : Icon(
                      Icons.brightness_2,
                    ),
              onPressed: () {
                setState(() {
                  if (context.read<ThemeChangeNotifier>().isDarkModeOn) {
                    context.read<ThemeChangeNotifier>().updateTheme(false);
                  } else {
                    context.read<ThemeChangeNotifier>().updateTheme(true);
                  }
                });
              },
              tooltip: 'Switch Theme Mode',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, int index) {
    var listTile = ListTile(
      title: Text(
        todoList[index],
        // style: TextStyle(color: CustomTheme.primaryColor),
      ),
      leading: IconButton(
          padding: EdgeInsets.only(bottom: 2),
          icon: Icon(Icons.check_box_outline_blank),
          onPressed: () => markAsComplete(index, context)),
    );

    var dismis = Card(
      // margin: EdgeInsets.only(bottom: 5),
      elevation: 3,
      shape: RoundedRectangleBorder(
        //side: BorderSide(width: 0.9, color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Dismissible(
        key: GlobalKey(),
        child: listTile,
        onDismissed: (DismissDirection dir) {
          markAsComplete(index, context);
        },
        background: Container(
          color: Colors.green,
          padding: EdgeInsets.only(left: 4),
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.done,
          ),
        ),
        secondaryBackground: Container(
          color: Colors.green,
          padding: EdgeInsets.only(right: 4),
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.done,
          ),
        ),
      ),
    );

    return dismis;
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            //color: CustomTheme.backgroundColor,
            icon: Icon(Icons.list),
            onPressed: () {
              _refreshToDo();
            },
            tooltip: 'ToDo',
          ),
          IconButton(
            //color: CustomTheme.backgroundColor,
            icon: Icon(Icons.add),
            onPressed: () {
              _addToDoWidget(context);
            },
            tooltip: 'Add new ToDo',
          ),
          IconButton(
            //color: CustomTheme.backgroundColor,
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CompletedToDo(completedTodoList: completedTodoList)));
            },
            tooltip: 'Completed ToDo',
          ),
        ],
      ),
    );
  }

  void _addToDoWidget(BuildContext context) {
    TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Add ToDo..",
            style: Theme.of(context).textTheme.headline6,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: Theme.of(context).textTheme.bodyText2,
                autofocus: true,
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'What you want to do!',
                  // border: Theme.of(context).inputDecorationTheme.border,
                ),
                toolbarOptions: ToolbarOptions(
                  cut: true,
                  copy: true,
                  selectAll: true,
                  paste: true,
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              // color: CustomTheme.primaryColor,
              child: Text("Load Test Data"),
              onPressed: () {
                setState(() {
                  todoList = testTodoList = Utils.getTestToDo();
                  Navigator.pop(context);
                });
              },
            ),
            FlatButton(
              // color: CustomTheme.primaryColor,
              child: Text("ADD"),
              onPressed: () {
                //showSnackBar(context, textController.text);
                setState(() {
                  String text = textController.text;
                  if (text != null && text.isNotEmpty) _addToDo(text);
                  Navigator.pop(context);
                });
              },
            )
          ],
        );
      },
    );
  }

  void markAsComplete(int index, BuildContext context) {
    setState(() {
      String completedToDo = todoList.removeAt(index);
      completedTodoList.add(completedToDo);
      Widgets.showSnackBar(context, '$completedToDo Completed');
      if (testTodoList == null) {
        DBHandler().saveData(pendingToDo_Key, todoList);
        DBHandler().saveData(completedToDo_Key, completedTodoList);
      }
    });
  }

  void _refreshToDo() {
    setState(() {
      fpendingTodoList = DBHandler().loadData(pendingToDo_Key);
      fcompletedTodoList = DBHandler().loadData(completedToDo_Key);
      fpendingTodoList.then((value) => pendingTodoList = value);
      fcompletedTodoList.then((value) => completedTodoList = value);
    });
  }

  void _addToDo(String todo) {
    setState(() {
      testTodoList = null;
      if (pendingTodoList != null) pendingTodoList.add(todo);
      todoList = pendingTodoList;
      DBHandler().saveData(pendingToDo_Key, todoList);
    });
  }
}
