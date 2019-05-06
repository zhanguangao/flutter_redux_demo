import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux_demo/middleware/logging.dart';
import 'package:flutter_redux_demo/reducers/index.dart';
import 'package:flutter_redux_demo/store/state.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';


configureStore() async{
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson), 
    throttleDuration: Duration(seconds: 2),   //which will throttle saving to disk to prevent excessive writing
    debug: false
  );

  final initialState = await persistor.load();

  final store = new Store<AppState>(
    appReducer, 
    initialState: initialState ?? AppState.initial(),
    middleware: [ loggingMiddleware, thunkMiddleware, persistor.createMiddleware() ],
  );
  return store;
}