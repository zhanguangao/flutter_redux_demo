import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_demo/actions/count.dart';
import 'package:flutter_redux_demo/store/state.dart';
import 'package:flutter_redux_demo/view_modal.dart';
import 'package:flutter_redux_demo/store/config.dart';


void main() async{    
  final store = await configureStore();

  return runApp(new FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  FlutterReduxApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.light(),
        title: title,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('You have pushed the button this many times:'),
                SimpleText(),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AddButton(),
              DesButton(),
              AddAsyncButton(),
            ],
          ),
        )
      )

    );
  }
}

class SimpleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return AppStateViewModel(
          state: store.state,
        );
      },
      builder: (context, vm) {
        String count = vm.state.countState.count.toString();
        String clickCount = vm.state.countState.clickCount.toString();

        return Text(
          'count: $count, clickCount: $clickCount',
          style: Theme.of(context).textTheme.subhead,
        );
      },
    );
  }
}


class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return AppStateViewModel(onClick: () {
          store.dispatch(new IncrementAction(1));
          store.dispatch(clickCount());
          // store.dispatch(increment(1));
          // store.dispatch(clickCount());
        });
      },
      builder: (context, vm) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: vm.onClick,
            tooltip: 'Increment',
            child: Icon(Icons.exposure_plus_1),
          ),
        );
      },
    );
  }
}

class AddAsyncButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) {
        return  () {
          store.dispatch(asyncIncrement(1));
          store.dispatch(clickCount());
        };
      },
      builder: (context, callback) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: callback,
            tooltip: 'Increment',
            child: Icon(Icons.slow_motion_video),
          ),
        );
      },
    );
  }
}

class DesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return AppStateViewModel(onClick: () {
          store.dispatch(new DecrementAction(1));
          // store.dispatch(decrement(1));
          // store.dispatch(clickCount());
        });
      },
      builder: (context, vm) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: vm.onClick,
            tooltip: 'des',
            child: Icon(Icons.exposure_neg_1),
          ),
        );
      },
    );
  }
}