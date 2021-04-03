import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sTitle = "4. TextField 사용법";
    return MaterialApp(
        title: sTitle,
        home: Scaffold(
            appBar: AppBar(
              title: Text(sTitle),
            ),
            body: RootWidget()));
  }
}

// 상태 갱신을 위한 위젯 (StatefulWidget)
class RootWidget extends StatefulWidget {
  @override
  RootWidgetState createState() {
    return RootWidgetState();
  }
}

class RootWidgetState extends State<RootWidget> {
  String _display = "Test";

  @override
  Widget build(BuildContext context) {
    return buildTestBody();
  }

  // TextField의 컨트롤러 선언
  final editController = TextEditingController();

  // 화면출력
  void setDisplay(String s) {
    setState(() {
      _display = s;
    });
  }

  // 초기화
  @override
  void initState() {
    super.initState();
    editController.addListener(() {
      setDisplay(editController.text);
    });
  }

  // 종료될 시
  @override
  void dispose() {
    editController.dispose();
    super.dispose();
  }

  // State내의 widget 필드는 State를 생성한 StatefulWidget을 지정하고 있다.
  Widget buildTestBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // display
        Text(_display, style: TextStyle(fontSize: 36)),

        // TextField 예제
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '입력하세요',
          ),
          onChanged: (text) {
            setDisplay(text);
          },
        ),
        TextField(
          controller: editController,
        )
      ],
    );
  }
}
