class Test {
  String name = null;
  int _age = 0;
  int get age => _age;
  set age(int n) {
    if (n > 40)
      _age = 40;
    else
      _age = n;
  }

  Test() {
    instanceCount++;
  }

  Test.namedInit(String name) {
    this.name = name;
    instanceCount++;
  }

  static int instanceCount = 0;
}

void main(List<String> args) {
  var t = Test();
  t.age = 52;
  print(t.age);

  var t2 = new Test();
  print(t2.name);
  print(Test.instanceCount);

  var t3 = Test.namedInit("name");
  print(t3.name);
}
