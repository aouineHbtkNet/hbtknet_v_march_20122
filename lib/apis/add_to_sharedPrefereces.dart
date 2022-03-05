


import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider  extends ChangeNotifier{



  addDeliveryFeeAmountToSPB(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('deliveryfeeamount',value);
    notifyListeners();

  }

  double? deliveryAmount;
  getDeliveryFeeAmountFromSPB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   deliveryAmount = await  prefs.getDouble('deliveryfeeamount');
   notifyListeners();

  }





  addTokenToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('spToken',value);

  }

  addTableToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('table',value);

  }

  addUserIdToSPB(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', value);
  }

  addUserNameToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', value);
  }


  addUserEmailToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', value);
  }








//how to get the value of  delivery fees

  //  await  AddToSharedPreferences().addDeliveryFeeAmountToSPB(7000002356543456);
  // await AddToSharedPreferences().getDeliveryFeeAmount();
  //SharedPreferences prefs = await SharedPreferences.getInstance();
 // double?  _deliveryFeeAmount= await prefs.getDouble('deliveryfeeamount');
 // print('yyyyyyyyyyyyyyyyy$_deliveryFeeAmount');









}

