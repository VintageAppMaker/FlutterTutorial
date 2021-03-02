### Variable 
> 변수의 정의, 대입에 대해 알아본다. 

- [전체소스](variable.dart)
- [dartpad로 실행하기](https://dartpad.dev/d4d1b2d5c17bfcb58a9c7bd602e19364)

1. 기본적으로는 Data형을 선언해야 함(정적선언).
~~~
    Dart는 기본적으로는 변수를 정적선언해야 한다. 
    그러나 유연함을 제공한다. num 형의 경우, 숫자형 데이터 대부분을 처리할 수 있다. 
~~~
~~~dart
  // 1. 정적선언: num 형
  num anyNumber = 1;
  anyNumber = 1.3;
  anyNumber = anyNumber * 1000000;
  print(anyNumber);
~~~

2. 그러나 var를 선언하고 값을 넣으면 자동으로 데이터형이 지정됨. 
3. 한 번 지정된 변수는 데이터형을 변경할 수 없음. 

~~~
    var로 선언된 변수의 최초 대입된 값이 그 변수의 데이터형이 된다.
    그러므로 다른 형을 대입시 Dart를 에러를 발생시킨다. 
~~~
~~~dart
  // 2. 대입과 동시에 데이터형 선언
  var name  = "snake";
  // 3. 최초 대입된 형과 다른 값은 대입이 불가능 
  // name = 30;
  var count = 52;
~~~


4. dynamic 형은 모든 데이터 형을 받을 수 있음.

~~~
기본 데이터 형은 
    숫자형(int, double, num) ⇒ num의 경우 대부분의 숫자형을 대입가능
    문자형(String)
    부울린형(bool)
~~~    

~~~dart
  // 4. dynamic 형
  dynamic anyData = "test";
  anyData = 19700327;
  anyData = 3/2;
  
  print(anyData);
~~~

~~~
    dynamic 형으로 선언된 변수는 어떠한 형태의 값도 받을 수 있다. 
    최종 대입된 값의 데이터 형이 변수의 형이된다. 
~~~

5. 문자열은 bash와 유사한 포멧스트링을 지원 ${}
~~~dart
  // 5. 포멧스트링 지원
  print("${name} => ${count}"); 
  print(" 1 + 4  => ${1 + 4}"); 
~~~

~~~
    ${}안에 변수를 사용하거나 연산식 및 결과값을 반환하는 비교문도 사용 가능하다. 
    그러나 가독성을 위해서 가급적이면 
    간단한 함수호출 및 수식정도만 사용하는 것이 좋다.  
~~~

6. final(런타임시 초기화), const(컴파일시 초기화)

~~~dart
  // 6. final(런타임시 초기화), const(컴파일시 초기화)
  const int MAX_COUNT = 1000;
  final String NOW    = DateTime.now().toString(); 
  print("${MAX_COUNT} => ${NOW} " );
~~~
~~~
    java와 유사하게 final과 const를 사용가능하다. 
~~~