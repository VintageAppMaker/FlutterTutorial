import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sTitle = "2. Button 사용법";
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
        // Button 예제
        ElevatedButton(
            onPressed: () {/*이벤트 핸들러*/}, child: Text('1. RaisedButton')),
        TextButton(onPressed: () {/*이벤트 핸들러*/}, child: Text('2. FlatButton')),
        SizedBox(
            width: double.infinity, // <-- match_parent
            child: TextButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "안녕하세요~");
                },
                child: Text(
                  '3. FlatButton',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ))),
        // OutlineButton(
        //     color: Colors.red,
        //     textColor: Colors.redAccent,
        //     child: Text("4. Outline Button"),
        //     onPressed: null,
        //     borderSide: BorderSide(width: 0.7, color: Colors.red)),

        FloatingActionButton.extended(
          backgroundColor: const Color(0xffFFFF06),
          foregroundColor: Colors.black,
          onPressed: () {
            // Respond to button press
          },
          icon: Icon(Icons.access_alarms),
          label: Text('알람설정'),
        ),
        IconButton(
          icon: Icon(Icons.access_alarm),
          tooltip: 'alarm setting',
          onPressed: () {},
        )
      ],
    );
  }
}
