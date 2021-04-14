### StreamBuilder
> Flutter에서 StreamBuilder를 통한 순차적인 작업관리

- [전체소스](../../lib/statemanagement/StreamBuilderExample.dart)
- [dartpad로 실행하기](#) - Dartpad 지원안함


- pubspec.yaml에서 http: ^0.13.0 을 추가한다.
- Stream<데이터형> 함수명() async*(){}로 순차적으로 처리할 비동기 함수를 구현한다. 반환값은 Stream<데이터형> 형이다.
- 함수 내에서는 await를 통한 비동기 업무가 진행된다. 결과값을 외부에 보내려면 yield를 사용한다.
~~~ dart
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
~~~
- Stream<데이터형>값을 수신하려면 StreamBuilder()안의
  - stream에서 이전에 정의한 Stream 함수를 넘긴다 (getRequestsByStream).
  - builder에서는 (context, stream) {} 함수를 구현한다. 파라메터로 넘겨진 stream의 상태를 보며 프로그래밍 가능하다(done, hasData).
    -  done은 전송함수(getRequestsByStream)가 종료되었을 때이다.
    -  hasData는 전송함수(getRequestsByStream)에서 yield로 값을 보낼 때이다.
~~~dart
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
~~~
