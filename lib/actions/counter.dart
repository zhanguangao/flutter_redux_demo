import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux_demo/store/state.dart';


class IncrementAction {
  final int offset;
  IncrementAction(this.offset);
}

class DecrementAction {
  final int offset;
  DecrementAction(this.offset);
}

class ClickCountAction { }

class AsyncIncrementAction {
  final int offset;
  AsyncIncrementAction(this.offset);
}

ThunkAction<AppState> asyncIncrement(int offset) {
  return (Store<AppState> store) async {
    await Future.delayed(Duration(seconds: 1));
    store.dispatch(new IncrementAction(1));
  };
}