import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();

  static final Preferences _instance = Preferences._();

  static SharedPreferences? _shared;

  final String _token = 'token';

  static Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  set token(String? value) {
    if (value == null) return;
    _shared?.setString(_token, value);
  }

  String? get token => _shared?.getString(_token);

  Future<void> clear() async {
    await _shared?.clear();
  }

  static Preferences get instance => _instance;
}

Preferences preferences = Preferences.instance;
