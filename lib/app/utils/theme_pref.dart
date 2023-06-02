import 'package:injectable/injectable.dart';

import 'constant.dart';
import 'pref.dart';

@Singleton(order: DiOrder.themePref)
class ThemePref extends Pref<bool> {
  @override
  String get prefKey => "theme";

  @override
  bool? getValue() {
    return prefs.getBool(prefKey);
  }

  @override
  Future<bool> setValue(bool value) {
    return prefs.setBool(prefKey, value);
  }
}
