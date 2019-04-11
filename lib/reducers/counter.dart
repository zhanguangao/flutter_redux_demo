import 'package:flutter_redux_demo/store/counter.dart';
import 'package:flutter_redux_demo/actions/counter.dart';
import 'package:redux/redux.dart';


final counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, IncrementAction>(_increment),
  TypedReducer<CounterState, DecrementAction>(_decrement),
  TypedReducer<CounterState, ClickCountAction>(_clickCount),
  TypedReducer<CounterState, AsyncIncrementAction>(_asyncDecrement),
]); 

CounterState _increment(CounterState state, IncrementAction action) {
  return state.copyWith(count: state.count + action.offset);
}

CounterState _decrement(CounterState state, DecrementAction action) {
  return state.copyWith(count: state.count - action.offset);
}

CounterState _clickCount(CounterState state, ClickCountAction action) {
  return state.copyWith(clickCount: state.clickCount + 1);
}

CounterState _asyncDecrement(CounterState state, AsyncIncrementAction action) {
  return state.copyWith(count: state.count + action.offset);
}

