import 'dart:async';
import 'package:flutter/material.dart';


class RefreshIndicatorExample extends StatefulWidget {
  @override
  _RefreshIndicatorExampleState createState() => new _RefreshIndicatorExampleState();
}

class _RefreshIndicatorExampleState extends State<RefreshIndicatorExample> {
  var counter = 0;
  var items = <Widget>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("24. RefreshIndicator 예제"),
      ),
      body: Column(children: [
        Text("pulldown하면 데이터 갱신", style: TextStyle(fontSize: 20, color: Colors.red),),
        Expanded(child: RefreshIndicator(
          child: ListView(
            children: getItemsByDesc(),
          ),
          onRefresh: refreshHandler,
        ))
      ],),
    );
  }

  List<Widget> getItemsByDesc() {
    return items.reversed.toList();
  }

  Future<Null> refreshHandler() async {
    await Future.delayed(new Duration(seconds: 2));

    setState(() {
      addItems(counter++);
    });
  }

  void addItems(int n) {
    items.add(ListTile(
        title: Text("$n")));

    print(items.length);

  }
}