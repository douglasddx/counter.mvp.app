import 'package:counter_mvp/pages/counter/presenter/counter_presenter.dart';
import 'package:counter_mvp/pages/counter/view/counter_view.dart';

class CounterPresenterImplem implements CounterPresenter {
  late final CounterView _view;
  var _counter = 0;

  @override
  void increment() {
    _counter++;
    _view.refreshState(_counter);
  }

  @override
  void incrementAndRedirect() {
    _counter++;
    _view.refreshState(_counter);
    _view.redirect();
  }

  @override
  void decrementAndMessage() {
    _counter--;
    _view.refreshState(_counter);
    _view.showMessage('Valor decrementado!');
  }

  @override
  set view(CounterView view) => _view = view;
}
