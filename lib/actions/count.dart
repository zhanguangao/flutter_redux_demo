import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux_demo/actions/types.dart';
import 'package:flutter_redux_demo/store/state.dart';

increment(int offset) {
  return {
    'type': INCREMENT,
    'payload': offset
  };
}

decrement(int offset) {
  return {
    'type' : DECREMENT,
    'payload': offset
  };
}

clickCount() {
  return {
    'type' : CLICK,
  };
}

ThunkAction<AppState> asyncIncrement(int offset) {
  return (Store<AppState> store) async {
    await Future.delayed(Duration(seconds: 1));
    store.dispatch(increment(offset));
  };
}