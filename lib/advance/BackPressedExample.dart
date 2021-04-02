import 'package:flutter/material.dart';

class BackPressedExample extends StatefulWidget {
  @override
  BackPressedStatus createState() => BackPressedStatus();
}

class BackPressedStatus extends State<BackPressedExample> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> onBackPressedHanlder() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('종료확인'),
        content: new Text('화면을 종료하시겠습니까?'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: FlatButton(child: Text("아니오")),
          ),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: FlatButton(child: Text("네")),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text("backbutton 관리"),
        ),
      ),
      onWillPop: onBackPressedHanlder,
    );
  }

}