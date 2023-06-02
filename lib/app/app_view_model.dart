import 'package:assarickym/app/utils/theme_pref.dart';
import 'package:injectable/injectable.dart';

import 'base/base_view_model.dart';

@Singleton()
class AppViewModel extends BaseViewModel {
  final ThemePref _themePref;
  AppViewModel(this._themePref);

  void initValue() {
    isDarkModeEnabled = _themePref.getValue() ?? false;
  }

  bool isDarkModeEnabled = false;

  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
    _themePref.setValue(false);
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    notifyListeners();
    _themePref.setValue(true);
  }
}
