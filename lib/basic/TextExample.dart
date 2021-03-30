import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sTitle = "1. Text 사용법";
    return MaterialApp(
        title: sTitle,
        home: Scaffold(
            appBar: AppBar(
              title: Text(sTitle),
            ),
            body: buildTestBody()));
  }

  Widget buildTestBody() {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Text 예제
        Text("Test"),
        Text("Test2", style: TextStyle(fontSize: 20)),
        Text("Test3", style: TextStyle(color: Colors.blue)),

        // 크기지정은 다른 Widget에서 설정해야 한다.
        Container(
            width: 200,
            child: Text(
                "Test4Test4Test4Test4Test4Test4Test4Test4Test4Test4Test4Test4Test4",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.red))),

        Container(
            width: double.infinity,
            child: Text("Test5",
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.black))),

        Text.rich(
          TextSpan( text: 'This',
            children: <TextSpan>[
              TextSpan(text: ' is ', style: TextStyle(color: Colors.green, fontStyle: FontStyle.italic)),
              TextSpan(text: ' rich 텍스트', style: TextStyle(fontWeight: FontWeight.bold)), ],
          ),
        )

      ],
    ));
  }
}
