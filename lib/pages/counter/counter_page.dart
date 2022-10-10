import 'package:counter_mvp/pages/counter/presenter/counter_presenter.dart';
import 'package:counter_mvp/pages/counter/presenter/counter_presenter_implem.dart';
import 'package:counter_mvp/pages/counter/view/counter_view.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> implements CounterView {
  var counter = 0;
  CounterPresenter presenter = CounterPresenterImplem();

  @override
  void initState() {
    presenter.view = this;
    super.initState();
  }

  @override
  void redirect() {
    Navigator.of(context).pushNamed('/novaTela', arguments: counter);
  }

  @override
  void refreshState(int newCounter) {
    setState(() {
      counter = newCounter;
    });
  }

  @override
  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Contador clicado:'),
          Text('$counter'),
          ElevatedButton(
            onPressed: () {
              presenter.increment();
            },
            child: const Text('Incrementar'),
          ),
          ElevatedButton(
            onPressed: () {
              presenter.incrementAndRedirect();
            },
            child: const Text('Incrementar e Redirecionar'),
          ),
          ElevatedButton(
            onPressed: () {
              presenter.decrementAndMessage();
            },
            child: const Text('Decrementar'),
          ),
        ]),
      ),
    );
  }
}
