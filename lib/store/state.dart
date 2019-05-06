
import 'package:flutter_redux_demo/store/counter.dart';
import 'package:flutter_redux_demo/store/theme.dart';

class AppState {
  final CounterState counter;
  final ThemeState theme;

  AppState({
    this.counter,
    this.theme
  });

  static AppState initial() {
    return AppState(
      counter: CounterState.initial(), 
      theme: ThemeState.initial()
    );
  }

  AppState copyWith({
    CounterState counter,
    ThemeState theme
  }) {
    return AppState(
      counter: counter ?? this.counter,
      theme: theme ?? this.theme
    );
  }

  //To only save parts of your state, simply omit the fields that you wish to not save from your serializer.
  ////when state is null, it will throw "The method '[]' was called on null".
  static AppState fromJson(dynamic json) {
    return json == null ? AppState.initial() : AppState(
      counter: CounterState.fromJson(json['counter']), 
      theme: ThemeState.fromJson(json['theme']),      
    );
  }

  dynamic toJson() => { 'counter': counter, 'theme': theme };
}

