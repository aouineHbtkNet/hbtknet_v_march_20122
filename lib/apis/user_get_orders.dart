import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/constant_strings/user_constant_strings.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';




class GetOrdersUser{


  Future  getOrdersUser(

  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    int? id = await prefs.getInt('id');
    print('sptoken ========================$spToken');
    print('id ========================$id');






    final url = Uri.parse(Constants.GET_ORDERS_FOR_USER);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',
    };
    Map<String, dynamic> body = {'user_id':id,};
    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    var jsondata = jsonDecode(response.body);

    // var jsondata = jsonDecode(response.body) as List;
    // List<Product> list =jsondata.map((product) =>Product.fromJason(product)).toList();


    print ('json=======================$jsondata');
    print(jsondata);

    return  jsondata;
  }

}




