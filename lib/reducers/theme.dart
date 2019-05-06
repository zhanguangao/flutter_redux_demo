import 'package:flutter_redux_demo/actions/theme.dart';
import 'package:flutter_redux_demo/store/theme.dart';
import 'package:redux/redux.dart';

final themeReducer = combineReducers<ThemeState>([
  TypedReducer<ThemeState, ChangeThemeAction>(_changeTheme),
]);

ThemeState _changeTheme(ThemeState state, ChangeThemeAction action) {
  return state.copyWith(primaryColor: action.primaryColor);
}