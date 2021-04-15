import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';

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
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();

    return MaterialApp(
      title: sTitle,
      home: Scaffold(
          appBar: AppBar(title: Text(sTitle)),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: buildDartSourcellView(style),
          )
      ),
    );
  }

  SingleChildScrollView buildDartSourcellView(SyntaxHighlighterStyle style) {
    return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: RichText(
                text: TextSpan(
                  style:
                  const TextStyle(fontFamily: 'monospace', fontSize: 12.0),
                  children: <TextSpan>[
                    DartSyntaxHighlighter(style).format(_str),
                  ],
                ),
              ),
            ),
          );
  }
}
