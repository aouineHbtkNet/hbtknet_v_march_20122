
import 'dart:convert';
import 'dart:io';
import 'package:simo_v_7_0_1/apis/future_functions_SP.dart';

import 'package:simo_v_7_0_1/modals/admin_login_response_model.dart';

import 'package:simo_v_7_0_1/modals/loginEndpointApiResponseFile.dart';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:simo_v_7_0_1/modals/user_response_update.dart';


class UserLogout{


  Future<bool> logoutOutUsers(String mytoken) async {

    Map<String, String> _loginHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };
    Uri _tokenUrl = Uri.parse('http://192.168.1.22/api_v_1/public/client/user/logout');
    http.Response response = await http.post(_tokenUrl, headers: _loginHeader,);
    var data = jsonDecode(response.body);

    return true;
  }





}