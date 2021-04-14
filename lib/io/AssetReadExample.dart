import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';

class AssetReadExample extends StatefulWidget {
  @override
  _AssetReadState createState() => _AssetReadState();
}

class _AssetReadState extends State<AssetReadExample> {
  String _str = "";

  // TextField의 컨트롤러 선언
  final editController = TextEditingController();
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
          body: SingleChildScrollView(
            child: Center(
              child: RichText(
                text: TextSpan(
                  style:
                      const TextStyle(fontFamily: 'monospace', fontSize: 14.0),
                  children: <TextSpan>[
                    DartSyntaxHighlighter(style).format(_str),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
