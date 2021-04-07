// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ProviderExample extends StatelessWidget {
  const ProviderExample({Key key}) : super(key: key);

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
}

class RootPage extends StatelessWidget {
  const RootPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('23. Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            NumberDisplay(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: UniqueKey(),

        // `context.read`를 호출하면 화면 rebuild를 하지않는다.
        onPressed: () => context.read<Counter>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NumberDisplay extends StatelessWidget {
  const NumberDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('클릭 수 : ${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}
