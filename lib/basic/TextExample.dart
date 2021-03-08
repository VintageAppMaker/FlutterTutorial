import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "1. Text 사용법",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Test 입니다."),
            ),
            body: buildTestBody()));
  }

  Widget buildTestBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Text 예제
        Text("Test"),
        Text("Test2", style: TextStyle(fontSize: 20)),
        Text("Test2", style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}
