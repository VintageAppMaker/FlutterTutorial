import 'dart:math';
import 'package:flutter/material.dart';

String sTitle = '21. Key Example';
class KeyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: sTitle,
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: KetExamplePage(),
    );
  }
}

class KetExamplePage extends StatefulWidget {
  @override
  _KeyExamplePageState createState() => new _KeyExamplePageState();
}

// key: ValueKey(), UniqueKey()와 같이 키값을 지정한다.
// 프레임웍에서는 위젯을 재정렬(refreash, rebuild)할 때, 키값을 보고 매칭한다.
// 이 때, 키값이 없는 위젯은 잘못된 매칭으로 재대로 갱신되지 못한다.

// 테스트를 위해 UniqueKey를 미적용 해보기 
class _KeyExamplePageState extends State<KetExamplePage> {
  List<Widget> lstItmes = [
    ChildWidget(sTitle: "1번 ", key: UniqueKey()),
    ChildWidget(sTitle: "2번 ", key: UniqueKey()),
  ];

  GlobalKey<_ChildState>? _ChildState1;
  bool bFirst = true;

  @override
  void initState() {
    _ChildState1 = GlobalKey<_ChildState>();
  }

  @override
  Widget build(BuildContext context) {
    if(bFirst)
      addNewWidget(context);
    bFirst = false;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(sTitle),
      ),
      body: Column(
        key: _ChildState1,
        children: lstItmes,
      )
      ,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.alternate_email_sharp),
          onPressed: () {
            changeWidget();
          }
      ),
    );
  }

  void addNewWidget(BuildContext context) {
    lstItmes.add(RaisedButton(child: Text("move page"), onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return OtherPage(_ChildState1);
        }),
      );
    }));

    // key값에 UniqueKey가 아닌 GlobalKey로 _ChildState1를 설정함
    // 글로벌변수처럼 사용하기 위함임.
    lstItmes.add(ChildWidget(sTitle: "3번 ", key: _ChildState1));
  }

  void changeWidget() {
    setState(() {
      lstItmes.insert( 1, lstItmes.removeAt(0) );
    });
  }
}

class ChildWidget extends StatefulWidget {
  String? sTitle = "";
  ChildWidget({
    Key? key,
    this.sTitle
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChildState();
  }
}

class _ChildState extends State<ChildWidget>{
  // State 안의 값을 유지하려면 생성시 외부에서
  // key를 넘겨주어야 한다.
  // 내부 값만 처리할 것이라면 UniqueKey()를 사용한다.

  // ===> 키값을 적용하지않고 위젯을 갱신시에는 myNumber값이 재대로 적용되지 않는다.
  int myNumber = 0;

  void increase(){
    setState(() {
      myNumber++;
    });
  }
  @override
  void initState() {
    super.initState();
    myNumber = Random().nextInt(100);
  }
  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(widget.sTitle!, style: TextStyle(fontSize: 20)), Text("$myNumber", style: TextStyle(fontSize: 20, color: Colors.red) )],);
  }
}

class OtherPage extends StatefulWidget {
  GlobalKey<_ChildState>? changeKey;
  OtherPage( this.changeKey){
    print(this.changeKey!.currentState!.myNumber);
  }
  @override
  _OtherPageState createState() => _OtherPageState();
}
class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(children: [
            SizedBox(height: 15,),
            Text("(+) 누르면 이전페이지 값도 변경됨", style: TextStyle(color: Colors.red, fontSize: 16),),
            SizedBox(height: 15,),
            Text("${widget.changeKey!.currentState!.myNumber}", style: TextStyle(color: Colors.red, fontSize: 26),),
            IconButton(icon: Icon(Icons.add), onPressed: (){
              setState(() {
                widget.changeKey!.currentState!.increase();
              });
            })
          ],)

      )

    );
  }
}