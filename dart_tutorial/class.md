### class
> class 사용법 정리

- [전체소스](class.dart)
- [dartpad로 실행하기](https://dartpad.dev/0818893c1a61a76baaf88524c6e78a26)

- 문법은 기본적으로 java와 유사하다.

1. new를 사용할 수도 안할 수도
2. 이름있는 생성자를 [클래스명.메소드명]으로 사용가능

~~~dart
  Test.namedInit(String name) {
    this.name = name;
    instanceCount++;
  }
~~~

3. 프로퍼티와 메소드는 자바와 동일
4. static 메소드는 자바와 동일
5. getter/setter 메소드 지원

~~~dart
  int _age = 0;
  int get age => _age;
  set age(int n) {
    if (n > 40)
      _age = 40;
    else
      _age = n;
  }
~~~
6. private/public 키워드없음. 이름에 _(언더스코어)를 쓰면 private으로 한다고 하지만, 외부사용은 가능함.
7. 상속은 extends