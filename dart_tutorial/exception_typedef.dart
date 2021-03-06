typedef fnType = void Function(String);
void main(List<String> args) {
  try {
    var rst = 1000 ~/ 0;
    print(rst);
  } on IntegerDivisionByZeroException {
    print("divided error");
  } catch (e) {
    print(e.toString());
  }

  void F1(String s) => print(s);
  void F2(String s) => print(s);
  void F3(String s, int n) => print(s * n);

  [F1, F2, F3].forEach((f) {
    if (f is fnType) {
      f("${f} is fnType");
    } else {
      f("${f} not fnType\n", 1);
    }
  });
}
