import 'package:flutter/foundation.dart';
import 'package:tiktok_clone_2023/threads/models/setting_model.dart';
import 'package:tiktok_clone_2023/threads/repositories/setting_repository.dart';

class SettingViewModel extends ChangeNotifier {
  final SettingRepository _repository;

  late final SettingModel _model = SettingModel(
    darkMode: _repository.isDarkMode(),
  );

  SettingViewModel(this._repository);

  bool get darkMode => _model.darkMode;

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    _model.darkMode = value;
    notifyListeners();
  }
}
