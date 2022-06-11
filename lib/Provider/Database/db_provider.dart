import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:restapi_provider/Screens/Authentication/login.dart';
import 'package:restapi_provider/Utils/routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseProvider extends ChangeNotifier {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

   //Setters
   String _token = '';
   String _userId = '';

   //Getters
   String get token => _token;
   String get userId => _userId;

   //method for saving token & userId
   void saveToken(String token) async {
     SharedPreferences value = await _pref;

     value.setString('token', token);
   }

   void saveUserId(String id) async {
     SharedPreferences value = await _pref;

     value.setString('id', id);
   }
      //Method to get token
  Future<String> getToken() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('token')) {
      String data = value.getString('token')!;
      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }

  }

  Future<String> getUserId () async {
    SharedPreferences value = await _pref;

    if (value.containsKey('token')) {
      String data = value.getString('token')!;
      _userId = data;
      notifyListeners();
      return data;
    } else {
      _userId = '';
      notifyListeners();
      return '';
    }
  }

  void logout(BuildContext context) async{
    final value = await _pref;

    value.clear();

    PageNavigator(ctx: context).nextPage(page: const LoginPage());
  }
}