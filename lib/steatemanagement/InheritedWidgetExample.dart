import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InWidgetExample extends StatelessWidget {

  String sTitle = "22.Inherited Widget 예제";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: sTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(sTitle),
          backgroundColor: Colors.red,
        ),
        body: _InWidgetExample(),
      ),
    );
  }
}

class _InWidgetExample extends StatefulWidget {

  @override
  _InWidgetExampleState createState() => _InWidgetExampleState();
}

class _InWidgetExampleState extends State<_InWidgetExample> {
  int _count = 10;
  void clearCount(){
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ** 하위 위젯에서 rootState를 액세스 가능
          rootState(
            clear: clearCount,
            count: _count, // 외부값과 바인딩함
            child: Column(
              children: [ChildOne(), ChildTwo(), ChildThree()],
            )
          ),
          OutlinedButton(
            child: const Text('+'),
            onPressed: () {
              setState(() {
                _count++;
              });
            },
          ),
          OutlinedButton(
            child: const Text('-'),
            onPressed: () {
              setState(() {
                _count--;
              });
            },
          ),
        ],
      ),
    );
  }
}

class rootState extends InheritedWidget {

  rootState({
    Key key,
    @required this.clear,
    @required this.count,
    @required Widget child, // 화면에 보여질 위젯
  }) : super(key: key, child: child);

  // << 외부값과 연결 바인딩 >>
  // 실제 데이터와 Action은 외부에서
  // 구현한다고 생각하고 관리하는 것이 편함
  Function clear;
  int count;

  // 외부에서 접근할 시 사용하는 메소드
  static rootState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<rootState>();
  }

  // 갱신조건
  @override
  bool updateShouldNotify(covariant rootState oldWidget) {
    return oldWidget.count != count;
  }
}

class ChildOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootState state = rootState.of(context);
    return Center(
      child: Text("${state.count} 입니다.", style: TextStyle(fontSize: 30),),
    );
  }
}

class ChildTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootState state
    = rootState.of(context);
    return Center(
      child: Text("${state.count} 입니다.", style: TextStyle(color: Colors.red, fontSize: 20),),
    );
  }
}

class ChildThree extends StatefulWidget {
  @override
  ChildThreeState createState() => ChildThreeState();
}

class ChildThreeState extends State<ChildThree>{
  Widget build(BuildContext context) {
    final rootState state = rootState.of(context);
    return Center(
        child: OutlinedButton(
          child: const Text('clear'),
          onPressed: () {
            setState(() {
              state.clear();
            });
          },
        )
    );
  }
}