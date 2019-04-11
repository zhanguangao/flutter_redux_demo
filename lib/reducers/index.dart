import 'package:flutter_redux_demo/reducers/counter.dart';
import 'package:flutter_redux_demo/store/state.dart';


AppState appReducer(AppState state, dynamic action) => 
  new AppState(
    counter: counterReducer(state.counter, action)
  );

