import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "2. Button 사용법",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Test 입니다."),
            ),
            body: buildTestBody()));
  }

  Widget buildTestBody() {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Button 예제
        RaisedButton(
            onPressed: () {/*이벤트 핸들러*/}, child: Text('1. RaisedButton')),
        FlatButton(onPressed: () {/*이벤트 핸들러*/}, child: Text('2. FlatButton')),
      ],
    ));
  }
}
