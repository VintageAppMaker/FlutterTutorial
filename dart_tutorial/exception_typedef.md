### 예외처리와 타입정의
> 예외처리와 타입정의 정리

- [전체소스](exception_typedef.dart)
- [dartpad로 실행하기](https://dartpad.dev/73bc8b0c13ab2af40c64bc8b7e52646d)


1. 예외처리
  ~~~dart
    try{ 

    } on 예외조건{

    } catch(예외객체){

    }
  ~~~
2. typedef 함수의 형을 정의할 때 사용

~~~dart
    typedef fnType = void Function(String);
~~~

