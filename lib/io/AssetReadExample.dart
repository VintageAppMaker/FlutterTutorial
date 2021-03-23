import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AssetReadExample extends StatefulWidget {
  @override
  _AssetReadState createState() => _AssetReadState();
}

class _AssetReadState extends State<AssetReadExample> {
  String _str = "";

  // TextField의 컨트롤러 선언
  final editController = TextEditingController();
  static String prefFIELD = "lastname";
  @override
  void initState() {
    super.initState();
    _loadString("assets/source/test.txt");
  }

  void _loadString(String sFile) async {
    String text = await rootBundle.loadString(sFile);
    setState(() {
      _str = text;
    });
  }

  String sTitle = "16. Preference ";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: sTitle,
      home: Scaffold(
        appBar: AppBar(title: Text(sTitle)),
        body: SingleChildScrollView( child: Center(
            child: Column(children: [
              Text("$_str"), // TextField 예제
            ])),
      )),
    );
  }
}
