import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<SharedPreferences> pref;
  Storage() {
    this.pref = SharedPreferences.getInstance();
  }

  void store(String ph, String pswd) async {
    SharedPreferences _pref = await pref;
    _pref.setString('phone', ph);
    _pref.setString('pswd', pswd);
  }

  Future<bool> check(String ph, String pswd) async {
    SharedPreferences _pref = await pref;
    if (_pref.getString('phone') == ph && _pref.getString('pswd') == pswd)
      return true;
    return false;
  }

  void setLogin() async {
    SharedPreferences _pref = await pref;
    _pref.setBool('loggedin', true);
  }

  Future<bool> get loginStatus async {
    SharedPreferences _pref = await pref;
    return _pref.getBool('loggedin') ?? false;
  }

  void setSignout() async {
    SharedPreferences _pref = await pref;
    _pref.setBool('loggedin', false);
  }

  Future<String> get details async {
    SharedPreferences _pref = await pref;
    return _pref.getString('phone');
  }
}