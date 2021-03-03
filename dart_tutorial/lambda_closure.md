### lambda와 closure
> lambda와 closure 사용법 정리

- [전체소스](lambda_closure.dart)
- [dartpad로 실행하기](https://dartpad.dev/a2208065fff51effb05d4fd1d9fb6d2f)

1. lambda는 익명함수이다. 함수의 파라메터로 함수를 넘길 때 많이 사용된다. 
    ~~~
    (파라메터) {구현} 
    ~~~

    ~~~dart
    [1, 2, 3].forEach((value) {
      print(value);
    });
    ~~~

3. 함수를 리턴하거나 넘길 때, 데이터형은 Function이다. 
4. 리턴값이 있는 1줄 함수라면 (파라메터) => {구현}
5. 클로져는 바깥 함수의 변수를 접근할 수 있는 내부의 익명함수를 말한다. 
   ~~~dart
   Function fnClosure(Function fn, int baseValue) {
     var nNum = baseValue;
     return (addNum) {
       nNum += fn(addNum);
       return nNum;
     };
   }

   print(fnClo1(2));
   print(fnClo1(3));
   print(fnClo1(4)); 
   ~~~
