
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';






class UserFunction {


  // ===================bringproducts for users  ============================================


  Map <String, dynamic> getProductsUsersResponseMap = {};

  Future <Map<String, dynamic>> getProductsUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    final Map<String, String> _userprofileHeader =
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',
    };
    Uri _tokenUrl = Uri.parse(
        'http://192.168.1.22/api_v_1/public/client/user/showproductsusers');
    http.Response response = await http.post(_tokenUrl, headers: _userprofileHeader);
     getProductsUsersResponseMap =  jsonDecode(response.body);
     return getProductsUsersResponseMap;
  }


}
