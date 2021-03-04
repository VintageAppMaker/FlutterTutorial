abstract class Animal {
  factory Animal(int type) {
    if (type == 0) return Dog();
    if (type == 1) return Cat();

    return null;
  }

  void cry();
}

class Dog implements Animal {
  @override
  void cry() {
    print("미야오옹~");
  }
}

class Cat implements Animal {
  @override
  void cry() {
    print("왈왈~");
  }
}

void main(List<String> args) {
  var animals = [Animal(0), Animal(1)];
  animals.forEach((ani) {
    ani.cry();
  });
}
