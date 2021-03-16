import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sTitle = "5. Layout 사용법";
    return MaterialApp(
        title: sTitle,
        home: Scaffold(
            appBar: AppBar(
              title: Text(sTitle),
            ),
            body: buildTestBody()));
  }

  Widget buildTestBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // layout 예제
        buildCenterColumn(),
        buildCenterRow(),
        buildSizedBox(),

        Divider(color: Colors.black),
        buildRow(),
        buildCenter()
      ],
    );
  }

  Center buildCenter() {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 130,
            height: 30,
            color: Colors.blue,
          ), //Container
          Container(
            width: 125,
            height: 25,
            color: Colors.orange,
          ), //Container
          Container(
            height: 20,
            width: 120,
            color: Colors.amber,
          ), //Container
        ], //<Widget>[]
      ), //Stack
    );
  }

  Row buildRow() {
    return Row(children: [
      Expanded(child: Image.asset("assets/images/title.jpg")),
      Expanded(
          flex: 2, child: Text('2배 비율로 공간을 늘립니다', textAlign: TextAlign.center)),
      Expanded(
        child: Icon(Icons.access_alarms),
      )
    ]);
  }

  SizedBox buildSizedBox() {
    return SizedBox(
        width: 100,
        height: 35,
        child: Container(
            width: double.infinity,
            color: Colors.orange,
            child: Text(
              "Sized",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, color: Colors.white),
            )));
  }

  Center buildCenterColumn() {
    return Center(
      child: Container(
          color: Colors.amber,
          width: double.infinity,
          margin: EdgeInsets.all(16),
          child: Column(
            children: [for (int i = 0; i < 10; i++) Text("$i")],
          )),
    );
  }

  Widget buildCenterRow() {
    return Container(
        color: Colors.cyan,
        width: double.infinity,
        margin: EdgeInsets.all(6),
        child: Row(
          children: [for (int i = 0; i < 10; i++) Text("$i")],
        ));
  }
}
