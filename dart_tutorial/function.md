### 함수
> 함수의 사용법 정리

- [전체소스](function.dart)
- [dartpad로 실행하기](https://dartpad.dev/f7b548af4cb6a1bf81484818739e6a40)


1. java와 같은 형태로 정의 
   리턴값 함수명(파라메터){코드}
2. =>를 사용하여 인라인함수 구현 
   - 리턴값 함수명(파라메터) => 코드

   ~~~dart
   String inlineTest(String s) => s + " (=>)inline function";
   ~~~

3. 이름있는 파라메터 함수명 이후 ()안에 {}로 정의함.   
   ~~~dart
   void namedFunc({String name, int age}) => print("${name} ${age}");
   namedFunc(name: "snake", age: 52);
   ~~~


4. 옵션적인 파라메터는 ()안에 []로 정의함

   ~~~dart
   void optionFunc(String name, [int age = 52]) => print("${name} ${age}");
   optionFunc("snake");
   ~~~

5. 함수 안에 함수정의 가능