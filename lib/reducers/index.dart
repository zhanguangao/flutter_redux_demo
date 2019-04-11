import 'package:flutter_redux_demo/reducers/count.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_demo/store/state.dart';


final appReducer = combineReducers<AppState>([
  counterReducer
]);

