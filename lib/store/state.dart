
import 'package:flutter_redux_demo/store/counter.dart';

class AppState {
  final CounterState counter;

  AppState({
    this.counter,
  });

  static AppState initial() {
    return AppState(
      counter: CounterState.initial(), 
    );
  }

  AppState copyWith({
    CounterState counter
  }) {
    return AppState(
      counter: counter ?? this.counter,
    );
  }

  //To only save parts of your state, simply omit the fields that you wish to not save from your serializer.
  ////when state is null, it will throw "The method '[]' was called on null".
  static AppState fromJson(dynamic json) {
    return json == null ? AppState.initial() : AppState(counter: CounterState.fromJson(json['counter']));
  }

  dynamic toJson() => { 'counter': counter };
}

