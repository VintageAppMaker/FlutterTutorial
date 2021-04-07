### Provider
> Flutter에서 Provider를 통한 상태관리

- [전체소스](../../lib/statemanagement/ProviderExample.dart)
- [dartpad로 실행하기](#) - Dartpad 지원안함


- pubspec.yaml에서 provider: ^4.3.3f 를 추가한다.
- ChangeNotifier로 상속받은 객체를 공유할 내용으로 구현한다.
~~~ dart
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
~~~
- MultiProvider()의 child 위젯에서 상태를 공유할 수 있게 한다.
~~~dart
  ...
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Counter()),
        ],
        child: MaterialApp(
          home: RootPage(),
        ));
  }
  
  ...
~~~

- context.read<ChangeNotifier로 선언한 클래스>()를 통해 객체를 가져와 사용한다.
~~~dart
  ...
  floatingActionButton: FloatingActionButton(
        key: UniqueKey(),

        onPressed: () => context.read<Counter>().increment(),
        child: const Icon(Icons.add),
      ),
  ...
  
~~~

- context.watch<ChangeNotifier로 선언한 클래스>()를 통해 객체를 가져오고 위젯과 변수를 바인딩할 수 있다.
~~~dart
  class NumberDisplay extends StatelessWidget {
    const NumberDisplay({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Text('클릭 수 : ${context.watch<Counter>().count}',
          style: Theme.of(context).textTheme.headline4);
    }
  }
~~~