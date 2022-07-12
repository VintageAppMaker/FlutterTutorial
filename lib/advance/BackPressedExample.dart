import 'package:flutter/material.dart';

class BackPressedExample extends StatefulWidget {
  @override
  BackPressedStatus createState() => BackPressedStatus();
}

class BackPressedStatus extends State<BackPressedExample> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> onBackPressedHanlder() async{
    bool isEnd = await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('종료확인'),
        content: new Text('화면을 종료하시겠습니까?'),
        actions: <Widget>[
          FlatButton(onPressed: () {  Navigator.of(context).pop(false); }, child: Text("아니오")),
          FlatButton(onPressed: () {  Navigator.of(context).pop(true); }, child: Text("네")),
        ],
      ),
    );
    return isEnd;
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
      onWillPop: onBackPressedHanlder as Future<bool> Function()?,
    );
  }
}
