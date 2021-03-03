/*
1. List(), [] 로 객체생성
2. <> 제너릭으로 선언안하면 다양한 값을 넣을 수 있음.
3. ...로 각 item을 추가할 수 있음(list 객체의 addAll과 유사).
4. set은 List와 유사하나 item이 중복안됨.
5. Set(), {}로 객체생성.
6. Map(), {}로 객체생성.

*/

void main() {
  // List
  var lst = List();
  lst.add("1");
  lst.add(1);
  print(lst);

  var lst2 = [12, "A", 34.2];
  lst2.add("huk");
  lst2.add(lst);
  print(lst2);

  var lst3 = [1, 2, ...lst2];
  print(lst3);

  //  Set
  var set = Set();
  set.add("aaa");
  set.add("aaa");
  set.add("aaa");
  print(set);

  var set2 = {1, 1, 1, 1, 1, 2, 2, 3, 3};
  set2.remove(3);
  print(set2);

  // map
  var mp = Map();
  mp["A"] = 1;
  mp[1] = 1;
  print(mp);

  var mp2 = {1: "one", 2: "two", "three": 3};
  mp2.remove(2);
  print(mp2);
}
