import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Item {
  int id;
  String title;

  Item(this.id, this.title);

  factory Item.fromJSON(Map<String, dynamic> json) {
    return Item(json['id'], json['title']);
  }
}

Future<Item> getIdFromHttp({int id = 1}) async {
  http.Response res = await http.get(Uri.https("jsonplaceholder.typicode.com", "/todos/$id"));
  return Item.fromJSON(json.decode(res.body));
}

// >>stream으로 통신결과를 management 가능<<
// 다수의 요청을 수행. 통신결과를 yield로 전송하여
// StreamBuilder에서 수신함.
// Future.delayed는 테스트를 위한 대기
Stream<Item> getRequestsByStream() async* {
  await Future.delayed(Duration(seconds: 3));
  yield await getIdFromHttp(id: 1);
  yield // data없이 보냄. progress 출력 테스트를 위한 코드
  await Future.delayed(Duration(seconds: 3));
  yield await getIdFromHttp(id: 2);
  yield// data없이 보냄. progress 출력 테스트를 위한 코드
  await Future.delayed(Duration(seconds: 3));
  yield await getIdFromHttp(id: 100);
  yield// data없이 보냄. progress 출력 테스트를 위한 코드
  await Future.delayed(Duration(seconds: 3));
}

class StreamBuilderExample extends StatefulWidget {
  StreamBuilderExample({Key key}) : super(key: key);

  @override
  _StreamBuilderExampleState createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder(
            stream: getRequestsByStream(),
            builder: (context, stream) {
              if (stream.connectionState == ConnectionState.done) {
                return Text("모든 요청이 끝났습니다");
              }
              if (stream.hasData) {
                return Text("${stream.data.id} ${stream.data.title} received");
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }
}

