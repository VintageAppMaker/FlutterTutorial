### Button 위젯 
> Button 위젯의 사용법 정리

- [전체소스](../../lib/basic/ButtonExample.dart)
- [dartpad로 실행하기](https://dartpad.dev/d913fb213b165af576cae7b47fbd07a2?null_safety=true)


![](../images/ButtonExample.jpg)

- RaisedButton(윤곽이 있는 모양), FlatButton(윤곽이 없는 모양), OutlineButton(바깥쪽 라인있는 모양)
- FloatingActionButton(떠있는 아이콘모양), IconButton(아이콘 모양)
- 클릭에 대한 처리는 onPressed 파라메터에 함수를 구현해서 넘김
- child 파라메터로 Text를 생성하여 버튼에 문자열을 표시함 
- 버튼의 크기를 조절할 경우, SizedBox 안에 자식위젯(child)으로 생성
- color는 배경색
- shape에 버튼배경 지정가능 (ex: RoundedRectangleBorder )
- [SizedBox](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)는 위젯의 크기를 조절할 경우 사용함
    ~~~dart
    RaisedButton(
      color: Colors.red,
      onPressed: () {/*이벤트 핸들러*/},
      child: Text('1. RaisedButton')),
    
    FlatButton(onPressed: () {/*이벤트 핸들러*/}, child: Text('2. FlatButton')),
  
    SizedBox(
      width: double.infinity, // <-- match_parent
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
            color: Colors.amber,
            onPressed: () {
              Fluttertoast.showToast(msg: "안녕하세요~");
            },
            child: Text(
              '3. FlatButton',
              style: TextStyle(color: Colors.red, fontSize: 30),
     ))),
     
     OutlineButton(
       color: Colors.red,
       textColor: Colors.redAccent,
       child: Text("4. Outline Button"),
       onPressed: null,
       borderSide: BorderSide(width: 0.7, color: Colors.red)), 

     FloatingActionButton(
       onPressed: () {},
       child: Icon(Icons.thumb_up),
       backgroundColor: Colors.pink,
     ),
     
     IconButton(
       icon: Icon(Icons.access_alarm),
       tooltip: 'alarm setting',
       onPressed: () {},
     )  
    ~~~

- 모든 위젯은 자식 위젯이 1개일 때는 child, 여러개일 때는 children이라는 필드를 사용한다. 
- Fluttertoast를 사용하기 위해서는 [플러그인](https://pub.dev/packages/fluttertoast)을 포함시켜야한다.
