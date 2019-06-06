import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_demo/actions/counter.dart';
import 'package:flutter_redux_demo/actions/theme.dart';
import 'package:flutter_redux_demo/store/state.dart';
import 'package:flutter_redux_demo/store/view_modal.dart';
import 'package:flutter_redux_demo/store/config.dart';


void main() async{    
  final store = await configureStore();
  return runApp(new FlutterReduxDemo(   
    store: store
  ));
}

class FlutterReduxDemo extends StatelessWidget {
  final Store<AppState> store;  

  FlutterReduxDemo({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: Main(title: 'Flutter Redux Demo',)
    );
  }
}

class Choice {
  final String title;
  const Choice({this.title}); 
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Blue'), 
  const Choice(title: 'Red'),  
  const Choice(title: 'green'),
  const Choice(title: 'orange'),
  const Choice(title: 'Black'),
];

const MAP_COLOR = { 
  'Red': Colors.red,
  'Blue': Colors.blue,
  'orange': Colors.orange,
  'green': Colors.green,
  'Black': Colors.black,
};


class Main extends StatelessWidget {
  final String title;
  Main({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return AppStateViewModel(
          state: store.state,
          onClickWithParam: (primaryColor) {
            store.dispatch(new ChangeThemeAction(primaryColor));
          },
        );
      },
      builder: (context, vm) {
        return new MaterialApp(
          theme: new ThemeData(primaryColor: MAP_COLOR[vm.state.theme.primaryColor]),
          title: title,        
          home: new Scaffold(
            appBar: new AppBar(
              title: new Text(title),
              actions:<Widget> [
                 PopupMenuButton<Choice>(
                    onSelected: (Choice choice) {
                      vm.onClickWithParam(choice.title);
                    },
                    itemBuilder: (BuildContext context) {
                      return choices.map((Choice choice) {
                        return PopupMenuItem<Choice>(
                          value: choice,
                          child: Text(choice.title),
                        );
                      }).toList();
                    },
                  ),             

              ],
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
        );
      },
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
        String count = vm.state.counter.count.toString();
        String clickCount = vm.state.counter.clickCount.toString();

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
          store.dispatch(new ClickCountAction());
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
          store.dispatch(new ClickCountAction());
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