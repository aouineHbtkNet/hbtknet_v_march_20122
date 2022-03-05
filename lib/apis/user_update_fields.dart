import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/constant_strings/user_constant_strings.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';




class UserUpdateFields{


  Future  updateStatus( {

    int? orderId,
    String? status,
}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    print('sptoken ========================$spToken');
    final url = Uri.parse(Constants.UPDATE_STATUS);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',
    };
    Map<String, dynamic> body = {
      'order_id':orderId,
      'status':status,
    };
    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    var jsondata = jsonDecode(response.body);
    return  jsondata;
  }


  Future  updateEntrega( {

    int? orderId,
    String? maneraEntrega,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    print('sptoken ========================$spToken');
    final url = Uri.parse(Constants.UPDATE_MANERA_ENTREGA);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',
    };
    Map<String, dynamic> body = {
      'order_id':orderId,
      'manera_entrega':maneraEntrega,
    };
    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    var jsondata = jsonDecode(response.body);
    return  jsondata;
  }
  Future  updatePago( {

    int? orderId,
    String? maneraPago,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    print('sptoken ========================$spToken');
    final url = Uri.parse(Constants.UPDATE_MANERA_PAGO);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',
    };
    Map<String, dynamic> body = {
      'order_id':orderId,
      'manera_pago':maneraPago,
    };
    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    var jsondata = jsonDecode(response.body);
    return  jsondata;
  }








}

