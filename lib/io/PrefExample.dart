import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PrefExample extends StatefulWidget {
  @override
  _FileIOExampleState createState() => _FileIOExampleState();
}

class _FileIOExampleState extends State<PrefExample> {
  String _str = "";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // TextField의 컨트롤러 선언
  final editController = TextEditingController();
  static String prefFIELD = "lastname";
  @override
  void initState() {
    super.initState();
    _loadString();
  }

  void _loadString() async {
    _prefs.then((SharedPreferences prefs) {
      setState(() {
        _str = prefs.getString(prefFIELD) ?? "";
      });
    });
  }

  String sTitle = "16. Preference ";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: sTitle,
      home: Scaffold(
        appBar: AppBar(title: Text(sTitle)),
        body: Center(
            child: Column(children: [
          Text("$_str"), // TextField 예제
          TextField(onChanged: (text) {
            setState(() {
              _prefs.then((SharedPreferences prefs) {
                prefs.setString(prefFIELD, text).then((bool success) {
                  print("success");
                });
              });
            });
          }),
          RaisedButton(
              child: Text("load"),
              onPressed: (() {
                _loadString();
              })),
        ])),
      ),
    );
  }
}
