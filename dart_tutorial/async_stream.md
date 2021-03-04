### Stream을 이용한 비동기 프로그래밍
> Stream, StreamController를 이용한 비동기 프로그래밍을 정리

- [전체소스](async_stream.dart)
- [dartpad로 실행하기](https://dartpad.dev/3fd31cd8b612838e94b0878840927d9e)


1. Stream 클래스의 fromIterable
~~~
  fromIterable 함수의 파라메터로  
  iterable(==list형) 값들을 넘겨서 비동기 프로그래밍에서
  순차적인 프로그래밍을 구현할 수 있다. 
  listen()에서 값을 처리한다. 
~~~

~~~dart
  Future<String> doAsyncWork(int n, int delay) async {
    // Future 함수에서 await를 사용하면 비동기에서 순차적으로 처리가능하다.
    // await를 호출한 함수는 async로 정의해주어야 한다.
    await Future.delayed(Duration(seconds: delay));
    print("$n work launched!");
    return "$n번 작업이 $delay초 걸렸습니다";
  }

  int doSyncWork() => 4 * 3;

  var worklist = [
    await doAsyncWork(3, 5),
    await doAsyncWork(100, 1),
    doSyncWork()
  ];
  Stream.fromIterable(worklist).listen((i) {
    print('$i');
  });
~~~

2. Stream 클래스의 periodic
~~~
  periodic 함수의 파라메터로  
  Duration을 넘겨서 타이머 역할을 수행할 수 있다.  
  listen()에서 값을 처리한다. 
  take() 함수로 반복횟수를 제한할 수 있다. 
~~~

~~~dart
  int count = 0;
  int sum = 0;
  Stream.periodic(Duration(seconds: 3), (_) {
    count++;
  }) // n 시간단위로 할 일. Duration만 필수임.
      .take(6) // 6번까지만 take 없으면 무한대
      .listen((event) {
    // tick 이벤트가 발생할 때 핸들러
    sum += count;
    print("count: $count => sum : $sum");
  });
~~~

3. StreamController 클래스 

~~~
  broadcast()를 통한 StreamController 객체 생성. 
  Event 송신, 수신과 같은 기능을 구현할 수 있다(이벤트핸들러 구현). 
  Stream 클래스의 add()는 이벤트 발생
  listen()에서 값을 처리한다. 
  종료시 StreamController의 close() 메소드 호출 필요
~~~

~~~dart
  var sender = StreamController.broadcast();
  var eventhandler = sender.stream;
  eventhandler.listen((event) {
    if (event is String) {
      if (event == "quit") {
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
~~~