import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileHelper {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/test.txt');
  }

  Future<String> readStr() async {
    try {
      final file = await _localFile;

      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }

  Future<File> writeStr(String s) async {
    final file = await _localFile;
    return file.writeAsString(s);
  }
}

class FileIOExample extends StatefulWidget {
  final FileHelper storage;

  FileIOExample({Key? key, required this.storage}) : super(key: key);

  @override
  _FileIOExampleState createState() => _FileIOExampleState();
}

class _FileIOExampleState extends State<FileIOExample> {
  late String _str;

  // TextField의 컨트롤러 선언
  final editController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadString();
  }

  void _loadString() {
    widget.storage.readStr().then((String value) {
      setState(() {
        _str = value;
      });
    });
  }

  Future<File> _writeString(String s) {
    return widget.storage.writeStr(s);
  }

  // 화면출력
  void setDisplay(String s) {
    setState(() {
      _str = s;
    });
  }

  String sTitle = "15. File IO ";
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
            setDisplay(text);
          }),
          RaisedButton(
              child: Text("save"),
              onPressed: (() {
                _writeString(_str);
              })),
          RaisedButton(
              child: Text("load"),
              onPressed: (() {
                _loadString();
              })),
          RaisedButton(
              child: Text("back"),
              onPressed: (() {
                Navigator.pop(context);
              }))
        ])),
      ),
    );
  }
}
