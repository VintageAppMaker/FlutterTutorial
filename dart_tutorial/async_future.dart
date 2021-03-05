void main(List<String> args) async {
  await asyncProcess();
  thenMethodExample();
}

Future<String> waitAndGo() {
  return Future.delayed(Duration(seconds: 3), () => '3초 대기');
}

Future<void> asyncProcess() async {
  print('await와 async를 이용한 방법시작');
  var order = await waitAndGo();
  print('await의 결과: $order');
}

void thenMethodExample() {
  Future<int> compute(Function f) {
    int sum = f();
    return new Future.delayed(new Duration(seconds: 1), () {
      return sum;
    });
  }

  int myCalculate() => 37 + 45;
  compute(() => myCalculate()).then((v) {
    print("계산 후, 1초 대기하며 값을 then()으로 넘김 : sum() is $v");
  });
}
