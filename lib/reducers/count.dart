import 'package:flutter_redux_demo/store/count.dart';
import 'package:flutter_redux_demo/actions/types.dart';
import 'package:flutter_redux_demo/actions/count.dart';
import 'package:redux/redux.dart';


// CountState counterReducer(CountState state, dynamic action) {
//   switch (action['type']) {
//     case INCREMENT:
//       return state.copyWith(count: state.count + action['payload']);
//     case DECREMENT:
//       return state.copyWith(count: state.count - action['payload']);
//     case CLICK:
//       return state.copyWith(count: state.clickCount + 1);
//   }

//   return state;
// }

final counterReducer = combineReducers<CountState>([
  TypedReducer<CountState, IncrementAction>(_increment),
  TypedReducer<CountState, DecrementAction>(_decrement),
]); 

CountState _increment(CountState state, IncrementAction action) {
  return state.copyWith(count: state.count + action.offset);
}

CountState _decrement(CountState state, DecrementAction action) {
  return state.copyWith(count: state.count - action.offset);
}
