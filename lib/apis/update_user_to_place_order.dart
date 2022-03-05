
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/modals/user_response_update.dart';


class UpdateUserToPlaceOrder{



  Future<UserRespnseUpdate>  updateAllUserInfo( {

    required String name ,
    required String email,
    required String mobile_phone,
    String? fixed_phone,
    required String  address,
    String? identification_id
  }

      ) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    int? id = await prefs.getInt('id');
    print('sptoken ========================$spToken');
    print('id ========================$id');

    Map<String, String> _loginHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',

    };





    Uri _tokenUrl = Uri.parse('http://192.168.1.22/api_v_1/public/client/updateuserurl');
    Map<String, dynamic> body = {

      'id':id,
      'name':name ,
      'email': email,
      'mobile_phone':mobile_phone  ,
      'fixed_phone':fixed_phone  ,
      'address': address ,
      'identification_id':identification_id  ,

    };

    http.Response response = await http.post(
        _tokenUrl,
        headers: _loginHeader,
        body: jsonEncode(body));
    var data = jsonDecode(response.body);


    print('  data=============$data');
    UserRespnseUpdate userRespnseUpdate = UserRespnseUpdate();
    userRespnseUpdate = UserRespnseUpdate.fromJson(data);
    return userRespnseUpdate;

  }


}

