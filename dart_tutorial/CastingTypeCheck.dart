/*
형변환과 타입체크 방법

1. 문자열 -> 숫자(int, double, num의 parse() )
2. 숫자 -> 문자 (toString())
3. 객체의 casting은 as를 사용함
4. type check는 is를 사용함.

*/
void main(List<String> args) {
  var sNum = "1";
  num sum = int.parse(sNum) + num.parse(sNum) + double.parse("34.3");
  print(sum);

  var n = 0;
  print(n.toString() + " 입니다");

  if (n is num) {
    print("숫자");
  } else {
    print("숫자아님");
  }
}
