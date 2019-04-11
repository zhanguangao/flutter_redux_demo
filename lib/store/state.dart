
import 'package:flutter_redux_demo/store/count.dart';

class AppState {
  final CountState countState;

  AppState({
    this.countState,
  });

  static AppState initialState() {
    return AppState(
      countState: CountState.initialState(), 
    );
  }

  AppState copyWith({
    CountState countState
  }) {
    return AppState(
      countState: countState ?? this.countState,
    );
  }

  //To only save parts of your state, simply omit the fields that you wish to not save from your serializer.
  ////when state is null, it will throw "The method '[]' was called on null".
  static AppState fromJson(dynamic json) {
    return json == null ? AppState.initialState() : AppState(countState: json['countState']);
  }

  dynamic toJson() => { 'countState': countState };
}

