//  1. main 함수가 최초 실행함수(EntryPoint)
//  2. 출력함수는 print(리턴값 포함). 종결자는 ;(반드시 사용해야 함)
//  3. 주석은 //, /**/, ///
//  4. 강제는 아니지만 들여쓰기는 2칸이 일반적임
//  5. dart run 파일명 ⇒ 실행
//  6. dart compile exe ⇒ Windows에서 독립실행파일 생성

void main(List<String> args) {
  if (args.length > 0) {
    print(args[0]);
  }

  print("Hello Flutter");
  print("Hello world");
}
