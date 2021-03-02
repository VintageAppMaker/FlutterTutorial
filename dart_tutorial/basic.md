### 기본정보
> Dart 프로그래밍의 필수사항 

- [전체소스](basic.dart)
- [dartpad로 실행하기](https://dartpad.dev/d8b366c1a89759388de2a8cccf0e16fe)


1. main 함수가 최초 실행함수(EntryPoint)
~~~
    void main(){} 또는 
    void main(List<String> args){} 형식으로 정의한다. 
    최초실행함수이다. 리턴값인 void를 생략할 수도 있다. 
~~~
2. 출력함수는 print(리턴값 포함). 종결자는 ;(반드시 사용해야 함)
3. 주석은 //, /**/, ///
4. 강제는 아니지만 들여쓰기는 2칸이 일반적임
~~~
    dart와 Flutter가 HTML과 UI를 만드는 목적의 개발환경이다보니 
    오른쪽으로 들여쓰기가 많은 편이다. 그러므로 가독성을 위해 2줄로 
    줄여사용하는 것이 일반적이다. 
~~~
5. dart run 파일명 ⇒ 실행
6. dart compile exe ⇒ Windows에서 독립실행파일 생성

~~~dart
void main(List<String> args) {
  if (args.length > 0) {
    print(args[0]);
  }

  print("Hello Flutter");
  print("Hello world");
}
~~~