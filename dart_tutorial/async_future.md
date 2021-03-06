### Future를 이용한 비동기 프로그래밍
> Future를 이용한 비동기 프로그래밍을 정리

- [전체소스](async_future.dart)
- [dartpad로 실행하기](https://dartpad.dev/065980449b4648341a83b2ee43a01502)


1. Future 클래스의 delayed를 이용하여 비동기 프로그래밍
  ~~~
  Future.delayed( Duration, FutureOr<T>형 함수)
  ~~~
2. 반환값은 Future<T>
3. then() 함수에 반환값을 받음. 비동기 방식.
  ~~~dart
    // 넘겨진 함수를 실행한 후, 1초 대기하고 값을 반환
    Future<int> compute(Function f) {
      int sum = f();
      return new Future.delayed(new Duration(seconds: 1), () {
        return sum;
      });
    }

    void thenMethodExample() {
      int myCalculate() => 37 + 45;
      compute(() => myCalculate()).then((v) {
        print("계산 후, 1초 대기하며 값을 then()으로 넘김 : sum() is $v");
      });
    }
  ~~~

4. await를 사용하여 반환값이 받을 떄까지 대기함. await를 내부에서 사용하는 함수는 async로 표시해야 함.

  ~~~dart
    Future<String> waitAndGo() {
      return Future.delayed(Duration(seconds: 3), () => '3초 대기');
    }

    Future<void> asyncProcess() async {
      print('await와 async를 이용한 방법시작');
      var order = await waitAndGo();
      print('await의 결과: $order');
    }

  ~~~

  
