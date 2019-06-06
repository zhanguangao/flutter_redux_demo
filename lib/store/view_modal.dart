import 'package:flutter_redux_demo/store/state.dart';

class AppStateViewModel {
  final AppState state;
  final void Function() onClick;
  final void Function(dynamic param) onClickWithParam;

  AppStateViewModel({
    this.state,
    this.onClick,
    this.onClickWithParam
  });
}