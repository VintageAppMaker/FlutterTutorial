import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
class HTMLParserExample extends StatefulWidget {
  @override
  _HTMLParserExampleState createState() => _HTMLParserExampleState();
}


class _HTMLParserExampleState extends State<HTMLParserExample> {

  List<dom.Element> lst;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    final response =
        await http.get(Uri.https('vintageappmaker.tistory.com','' ) );
    print(response.body);
    final document = html_parser.parse(response.body);

    setState(() {
      lst = document.getElementsByClassName('thumbnail_post');
    });
  }

  @override
  Widget build(BuildContext context) {
    String sTitle = '20. HTMLParser 예제';
    return MaterialApp(
      title: sTitle,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(sTitle),
          ),
          body: SafeArea(
              child: lst == null
                  ? Center(
                      child:
                          CircularProgressIndicator(), // Loads Circular Loading Animation
                    )
                  : ListView.builder(
                      itemCount: lst.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(lst[index].parent.children[1].children[0].text ?? " ", style: TextStyle(fontSize: 14)),
                          trailing: Image.network("https:" + lst[index].children[0].attributes['src']),
                        );
                      }
                    )
          )),
    );
  }
}
