
import 'package:redux/redux.dart';
import 'package:flutter_redux_demo/store/state.dart';

loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');
  next(action);
}