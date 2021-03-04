### abstract, Factory
> dart에는 interface가 없음.

- [전체소스](abstract.dart)
- [dartpad로 실행하기](https://dartpad.dev/039146007c615e4157c120ba0f876065)


1. abstract로 선언, implements로 구현, @override로 정의.
2. factory로 생성자에서 abstract를 상속받은 객체를 바로 넘길 수 있음.

~~~dart
abstract class Animal{
  factory Animal(int type){
    if(type == 0) return Dog();
    if(type == 1) return Cat();
    
    return null;
  }

  void cry();
}

...

var animals = [Animal(0), Animal(1)];
animals.forEach((ani) {
  ani.cry();
});
~~~