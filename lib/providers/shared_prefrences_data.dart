



import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SpData extends ChangeNotifier{

  String?  _username;
  String?  get getUserName  =>_username;



   setUserNameToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', value);
    notifyListeners();
  }


    Future   _getUsername() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username  = await prefs.getString('username');


  }





}