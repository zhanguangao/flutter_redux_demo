import 'package:flutter_redux_demo/reducers/count.dart';
// import 'package:redux/redux.dart';
import 'package:flutter_redux_demo/store/state.dart';


// final rootReducers = combineReducers<AppState>([
//   counterReducer
// ]);

AppState appReducer(AppState state, dynamic action) => 
  new AppState(
    countState: counterReducer(state.countState, action)
  );

