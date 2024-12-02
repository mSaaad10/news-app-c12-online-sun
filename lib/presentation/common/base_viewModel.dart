import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_state.dart';

class BaseViewModel<T> extends ChangeNotifier {
  BaseState<T> state = LoadingState();

  void emit(BaseState<T> newState) {
    state = newState;
    notifyListeners();
  }
}
