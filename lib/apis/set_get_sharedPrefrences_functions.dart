import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/constant_strings/user_constant_strings.dart';

class SetAndGetSharedPrefrences{


  setSharedPrefrences(
  {

    required String name,
    required String email,
    required String mobilePhone,
    required String fixedPhone,
    required String address,
    required String identificationNumber,



  }


      ) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.USER_NAME_KEY,name);
    prefs.setString(Constants.USER_EMAIL_KEY,email);
    prefs.setString(Constants.USER_MOBILE_PHONE_KEY,mobilePhone);
    prefs.setString(Constants.USER_FIXED_PHONE_KEY,fixedPhone);
    prefs.setString(Constants.USER_ADDRESS_KEY,address);
    prefs.setString(Constants.USER_IDENTIFICATION_NUMBER_KEY,identificationNumber);

 }




}