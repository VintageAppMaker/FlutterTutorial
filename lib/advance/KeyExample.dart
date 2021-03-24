import 'dart:math';
import 'package:flutter/material.dart';

class KeyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Key Example',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new KetExamplePage(),
    );
  }
}

class KetExamplePage extends StatefulWidget {
  @override
  _KetExamplePageState createState() => new _KetExamplePageState();
}

// key: ValueKey(), UniqueKey()와 같이 키값을 지정한다.
// 프레임웍에서는 위젯을 재정렬(refreash, rebuild)할 때, 키값을 보고 매칭한다.
// 이 때, 키값이 없는 위젯은 잘못된 매칭으로 재대로 갱신되지 못한다.

List<Widget> lstItmes = [
    ChildWidget(sTitle: "1번 ", key: UniqueKey()),
    ChildWidget(sTitle: "2번 ", key: UniqueKey())
  ];

class _KetExamplePageState extends State<KetExamplePage> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: Column(
        children: lstItmes,
      )
      ,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.alternate_email_sharp),
          onPressed: () {
            setState(() {
              lstItmes.insert( 1, lstItmes.removeAt(0) );
            });
          }
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  String sTitle = "";
  ChildWidget({
    Key key,
    this.sTitle
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _childState();
  }
}

class _childState extends State<ChildWidget>{
  // State 안의 값을 유지하려면 생성시 외부에서
  // key를 넘겨주어야 한다.
  // 내부 값만 처리할 것이라면 UniqueKey()를 사용한다.

  // ===> 키값을 적용하지않고 위젯을 갱신시에는 myNumber값이 재대로 적용되지 않는다.
  int myNumber = 0;
  @override
  void initState() {
    super.initState();
    myNumber = Random().nextInt(100);
  }
  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(widget.sTitle, style: TextStyle(fontSize: 20)), Text("$myNumber", style: TextStyle(fontSize: 20, color: Colors.red) )],);
  }
}