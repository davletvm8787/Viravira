import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool isDispose = false;

  @override
  void notifyListeners() {
    if (!isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isDispose = true;
    disposeB();
    super.dispose();
  }

  void disposeB() {}
}
