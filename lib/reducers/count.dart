import 'package:flutter_redux_demo/actions/types.dart';
import 'package:flutter_redux_demo/store/state.dart';


AppState counterReducer(AppState state, dynamic action) {
  switch (action['type']) {
    case INCREMENT:
      return state.copyWith(count: state.count + action['payload']);
    case DECREMENT:
      return state.copyWith(count: state.count - action['payload']);
    case CLICK:
      return state.copyWith(count: state.clickCount + 1);
  }

  return state;
}
