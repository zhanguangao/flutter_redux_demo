import 'package:flutter_redux_demo/store/state.dart';
import 'package:flutter_redux_demo/actions/types.dart';
import 'package:flutter_redux_demo/store/count.dart';

AppState counterReducer(AppState state, dynamic action) {
  switch (action['type']) {
    case INCREMENT:
      return state.copyWith(countState: state.countState.count + action['payload']);
    case DECREMENT:
      return state.copyWith(countState: state.countState.count - action['payload']);
    case CLICK:
      return state.copyWith(countState: state.countState.clickCount + 1);
  }

  return state;
}