import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:syntax_highlighter/syntax_highlighter.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class AssetReadExample extends StatefulWidget {
  @override
  _AssetReadState createState() => _AssetReadState();
}

class _AssetReadState extends State<AssetReadExample> {
  String _str = "";

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

  String sTitle = "17. Asset 읽기 ";
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: sTitle,
      home: Scaffold(
          appBar: AppBar(title: Text(sTitle)),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: buildDartSourcellView(),
          )
      ),
    );
  }

  Widget buildDartSourcellView() {
    return SyntaxView(
        code: _str,
        syntax: Syntax.DART,
        syntaxTheme: SyntaxTheme.vscodeLight(),
        fontSize: 12.0,
        withZoom: true,
        withLinesCount: true,
        expanded: true);
  }
}
