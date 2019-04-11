import 'package:flutter_redux_demo/store/state.dart';

class AppStateViewModel {
  final AppState state;
  final void Function() onClick;

  AppStateViewModel({
    this.state,
    this.onClick,
  });
}