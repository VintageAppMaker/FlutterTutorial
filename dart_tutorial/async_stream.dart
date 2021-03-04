
import 'dart:async';

void main(List<String> args) async{
  // Stream 클래스의 
  // fromIterable는 
  // 비동기 작업을 순차적으로 처리할 때 사용한다.
  // await로 호출하면 비동기적으로 실행된다. 
  // 이 때 사용하는 외부함수는 
  // async로 선언한다. 
  await fromIterableTest();

  // Stream 클래스의 
  // periodic는 
  // 타이머와 유사하게 일정시간 반복되는 작업을 할 경우 
  // 사용한다.
  periodicTest();  

  // 이벤트를 발생시키고 기다리며 처리해야 할 경우 사용
  stramControllerTest();
}

void stramControllerTest() {
  var sender = StreamController.broadcast();
  var eventhandler = sender.stream;
  eventhandler.listen((event) {
    if(event is String){
      if (event == "quit"){
        sender.close();
      }
    }
    print("event is => $event");  
  });
  
  print("==== event 보내기");
  sender.add("event");
  sender.add([1, 2, 3]);
  sender.add(12.023);
  sender.add("quit");
  
  sender.add("quit이후 event 처리안됨");
}

void periodicTest() {
  int count = 0;
  int sum   = 0;
  Stream
    .periodic(Duration(seconds:3), (_){count++;}) // n 시간단위로 할 일. Duration만 필수임. 
    .take(10)                                     // 10번까지만 take 없으면 무한대
    .listen((event) {                             // tick 이벤트가 발생할 때 핸들러 
      sum += count;
      print("count: $count => sum : $sum" );  
  });
}

Future fromIterableTest() async {
  // 지연작업을 위한 Future 함수(비동기 작업) 
  Future<String> doWork(int n, int delay) async{
     // await를 사용해야 비동기적으로 처리가 된다(동기적 아님!).  
     await Future.delayed(Duration(seconds:delay));
     return "$n번 작업이 $delay초 걸렸습니다";
  }

  int getNum() => 4 * 3; 
  var worklist = [await doWork(3, 3), await doWork(100, 1), "동기작업1", "동기작업2", getNum()];
  Stream.fromIterable(worklist).listen((i) {
    print('$i');
  });
}