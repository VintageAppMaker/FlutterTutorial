import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldExample extends StatelessWidget {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // TextField 예제
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'TextField'
          ),
          onSubmitted: (String s){ print ("onSubmitted: => $s");},
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "TextFormField",
            labelText: 'Enter your username'
          ), 
          onChanged: (String s){ print ("onChaned: => $s"); },
        ), 
        
      ],
    );
  }
}


