import 'dart:convert';
import 'dart:io';


import 'package:simo_v_7_0_1/modals/json_products_plus_categories.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';
import 'package:simo_v_7_0_1/modals/user_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FutureFunctionsSP {

  // =======4/2/2022 used ok
  addTableToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('table',value);

  }



  // =======4/2/2022 used ok
  addTokenToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('spToken',value);

  }


  Future <void >getspTokenToSPFromApiForSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('spToken');
  }




  //==============================================addUserNameToSPB 4/2/2022  used ok   =============================

  addUserNameToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    prefs.setString('username', value);
  }




  //==============================================addPhoenNameToSPB 4/2/2022  used ok   =============================

  addUserPhoneToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    prefs.setString('userphone', value);
  }



//==============================================addUserAddressToSPB 4/2/2022  used ok   =============================

  addUseraddressToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    prefs.setString('useraddress', value);
  }








  //==================================Get shared preferences  Name  2.1========================================


  String  userNameFromSharedPtreferences ='';
  Future getuserNameFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userNameFromSharedPtreferences = prefs.getString('username') as String ;
    return userNameFromSharedPtreferences;
  }

  //==============================================  addUserEmailToSPB  4/2/2022  used ok
  addUserEmailToSPB(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', value);
  }











  //==================================Get shared preferences  Email 3.1  ========================================



  String  emailFromSharedPtreferences  ='';
  Future getuserEmailFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailFromSharedPtreferences  = prefs.getString('email') as String ;
    return emailFromSharedPtreferences ;
  }

//==================================== addUserIdToSPB  4/2/2022 used ok =======================================
  addUserIdToSPB(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', value);
  }

  //==================================Get shared preferences  id 4.1  ========================================


  int idFromSharedPtreferences = 0;
  Future getuserIdFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idFromSharedPtreferences   = prefs.getInt('id') as int;
    return idFromSharedPtreferences;
  }





  Future logoutFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('spToken');
    prefs.remove( 'username');
    prefs.remove('email');
    prefs.remove('id');



  }


   clearAllSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
    print('success');
  }














}
