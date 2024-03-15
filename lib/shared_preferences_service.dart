import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._internal();

  static Future<SharedPreferencesService> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
      await _instance!._initPreferences();
    }
    return _instance!;
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveSoundSettings(bool soundSetting) async {
    await _preferences.setBool('sound_settings', soundSetting);
  }

  Future<bool> getSoundSettings() async {
    return _preferences.getBool('sound_settings') ?? false;
  }
}
