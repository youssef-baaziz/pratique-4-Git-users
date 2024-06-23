import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_4/ui/themes/theme.dart';

abstract class ThemeEvent {}

class SwitchthemeEvent extends ThemeEvent {}

abstract class ThemeState {
  ThemeData themeData;
  ThemeState({required this.themeData});
}

class ThemeSuccessState extends ThemeState {
  ThemeSuccessState({required ThemeData themeData})
      : super(themeData: themeData);
  // themeSuccessEvent({required super.themeData});
}

class ThemeinitialState extends ThemeState {
  ThemeinitialState() : super(themeData: MyAppTheme.themes[1]);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  int currentIndex = 0;
  List<ThemeData> themes = MyAppTheme.themes;
  ThemeBloc() : super(ThemeinitialState()) {
    on<SwitchthemeEvent>((event, emit) {
      ++currentIndex;
      if (currentIndex >= themes.length) {
        currentIndex = 0;
      }
      emit(ThemeSuccessState(themeData: themes[currentIndex]));
    });
  }
}
