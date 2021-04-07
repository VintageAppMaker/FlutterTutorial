import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InWidgetExample extends StatelessWidget {
  final String sTitle = "22.Inherited Widget 예제";
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
  void clearCount() {
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
          RootState(
              clear: clearCount,
              count: _count, // 외부값과 바인딩함
              child: Column(
                children: [ChildOne(), ChildTwo(), ChildThree()],
              )),
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

class RootState extends InheritedWidget {
  RootState({
    Key key,
    @required this.clear,
    @required this.count,
    @required Widget child, // 화면에 보여질 위젯
  }) : super(key: key, child: child);

  // << 외부값과 연결 바인딩 >>
  // 실제 데이터와 Action은 외부에서
  // 구현하고 이곳에서는 바인딩(연결)만 관리
  final Function clear;
  final int count;

  // 외부에서 접근할 시 사용하는 메소드
  static RootState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RootState>();
  }

  // 갱신조건
  @override
  bool updateShouldNotify(covariant RootState oldWidget) {
    return oldWidget.count != count;
  }
}

class ChildOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RootState rs = RootState.of(context);
    return Center(
      child: Text(
        "${rs.count} 입니다.",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class ChildTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RootState rs = RootState.of(context);
    return Center(
      child: Text(
        "${rs.count} 입니다.",
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}

class ChildThree extends StatefulWidget {
  @override
  ChildThreeState createState() => ChildThreeState();
}

class ChildThreeState extends State<ChildThree> {
  Widget build(BuildContext context) {
    final RootState rs = RootState.of(context);
    return Center(
        child: OutlinedButton(
      child: Text('clear'),
      onPressed: () {
        setState(() {
          rs.clear();
        });
      },
    ));
  }
}
