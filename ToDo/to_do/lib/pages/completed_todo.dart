import 'package:flutter/material.dart';
import 'package:to_do/pages/widgets.dart';
import 'package:to_do/utils.dart';

class CompletedToDo extends StatefulWidget {
  final List completedTodoList;

  CompletedToDo({Key key, @required this.completedTodoList}) : super(key: key);

  @override
  _CompletedToDoState createState() => _CompletedToDoState();
}

class _CompletedToDoState extends State<CompletedToDo> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      padding: Utils.isLargeScreen(context)
          ? EdgeInsets.only(left: width / 3, right: width / 3)
          : null,
      child: Container(
        decoration: Utils.isLargeScreen(context)
            ? BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
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
                    childCount: widget.completedTodoList.length,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(20),
        title: Text(
          "Completed ToDo",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, int index) {
    var listTile = InkWell(
      onTap: () {
        delete(index, context);
      },
      child: ListTile(
        title: Center(
          child: Text(
            widget.completedTodoList[index],
          ),
        ),
        trailing: IconButton(
            icon: Icon(Icons.clear), onPressed: () => delete(index, context)),
      ),
    );

    var dismis = Card(
        //margin: EdgeInsets.only(bottom: 3),
        elevation: 3,
        shape: RoundedRectangleBorder(
          //side: BorderSide(width: 0.9, color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Dismissible(
            key: GlobalKey(),
            onDismissed: (DismissDirection dir) {
              delete(index, context);
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 4),
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.delete_forever,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              padding: EdgeInsets.only(right: 4),
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete_forever,
              ),
            ),
            child: listTile));
    return dismis;
  }

  void delete(int index, BuildContext context) {
    setState(() {
      String deletedToDo = widget.completedTodoList.removeAt(index);
      Widgets.showSnackBar(context, '$deletedToDo DELETED');
    });
  }
}
