### mixin, extesnsion
> mixin, extesnsion 사용법 정리

- [전체소스](mixin_extension.dart)
- [dartpad로 실행하기](https://dartpad.dev/93b89848bd530e12154dcf9a530b05c9)


1. mixin은 상속받지않고 코드를 재사용할 목적으로 사용된다. 결과적으로는 다중상속의 효과를 얻는다. 
    ~~~
    클래스명 대신 mixin을 사용한다. 
    mixin 정의된 클래스가 누군가를 상속받고자 한다면 on
    mixin 정의된 클래스를 사용하고자 한다면 with
    ~~~

    ~~~dart
    class Account {
      int money = 0;
    }

    mixin Salary on Account {
      void saveMoney(int n) => money += n;
    }

    mixin Hobby on Account {
      void spendMoney(int n) => money -= n;
    }

    class Worker extends Account with Salary, Hobby {}
    ~~~

2. class를 정의한 이후에도 다른 곳에서 클래스에 메소드를 추가할 수 있다. kotlin의 확장함수와 유사하다. 
    ~~~
    extension on 클래스명 {}
    ~~~

    ~~~dart
    extension on String {
      String multiString(int n){
      return this * n;
    }

    ...
    
    print ( "AAA ".multiString(3) );

    ~~~
