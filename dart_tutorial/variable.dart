
// 1. 기본적으로는 Data형을 선언해야 함(정적선언). 
// 2. 그러나 var를 선언하고 값을 넣으면 자동으로 데이터형이 지정됨. 
// 3. 한 번 지정된 변수는 데이터형을 변경할 수 없음. 
// 4. dynamic 형은 모든 데이터 형을 받을 수 있음.
// 기본 데이터 형은 
//    숫자형(int, double, num) ⇒ num의 경우 대부분의 숫자형을 대입가능
//    문자형(String)
//    부울린형(bool)
// 5. 문자열은 bash와 유사한 포멧스트링을 지원 ${}
// 6. final, const 사용가능 

void main(List<String> args) {

  // 1. 정적선언: num 형
  num anyNumber = 1;
  anyNumber = 1.3;
  anyNumber = anyNumber * 1000000;
  print(anyNumber);

  // 2. 대입과 동시에 데이터형 선언
  var name  = "snake";
  // 3. 최초 대입된 형과 다른 값은 대입이 불가능 
  // name = 30;
  var count = 52;

  // 4. dynamic 형
  dynamic anyData = "test";
  anyData = 19700327;
  anyData = 3/2;
  
  print(anyData);
  
  // 5. 포멧스트링 지원
  print("${name} => ${count}"); 
  print(" 1 + 4  => ${1 + 4}"); 

  // 6. final(런타임시 초기화), const(컴파일시 초기화)
  const int MAX_COUNT = 1000;
  final String NOW    = DateTime.now().toString(); 
  print("${MAX_COUNT} => ${NOW} " );
  
}