/*
- lambda는 익명함수이다. 
- (파라메터) {구현} 형식이다. 
- 함수를 리턴하거나 넘길 때, 데이터형은 Function이다. 
- 리턴값이 있는 1줄 함수라면 (파라메터) => {구현}

*/
void main(List<String> args) {
  // 형식은 (파라메터){코드}
  [1, 2, 3].forEach((value) {
    print(value);
  });

  // 람다함수를 변수에 대입 시
  var fnLambda = (String name) {
    print(name);
  };
  fnLambda("lambda");

  // closure
  Function fnClosure(Function fn, int baseValue) {
    var nNum = baseValue;
    return (addNum) {
      nNum += fn(addNum);
      return nNum;
    };
  }

  var fnClo1 = fnClosure((int n) {
    return n * 2;
  }, 5);

  print(fnClo1(2));
  print(fnClo1(3));
  print(fnClo1(4));
}
