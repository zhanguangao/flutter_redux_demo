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
    debug: true
  );

  var initialState;
  try {
    initialState = await persistor.load();
    print('initialState:$initialState');

  }catch (e) {  //when state is null, it will throw "The method '[]' was called on null".
    print('redux_persist exception: $e');
  }

  final store = new Store<AppState>(
    appReducer, 
    initialState: initialState ?? AppState.initialState(),
    middleware: [ loggingMiddleware, thunkMiddleware, persistor.createMiddleware() ],
  );
  return store;
}