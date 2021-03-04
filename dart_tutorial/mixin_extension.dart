class Account {
  int money = 0;
}

mixin Salary on Account {
  void saveMoney(int n) => money += n;
}

mixin Hobby on Account {
  void spendMoney(int n) => money -= n;
}

class Worker extends Account with Salary, Hobby {}

extension on Worker {
  void showMeTheMoney() => print(money.toTotal());
}

extension on int {
  String toTotal() => "${this} is saving";
}

void main(List<String> args) {
  var obj = Worker();
  // 1부터 10까지
  [for (var i = 0; i < 10; i += 1) i].forEach((n) {
    obj.saveMoney(n);
  });

  obj.spendMoney(20);
  obj.showMeTheMoney();
}
