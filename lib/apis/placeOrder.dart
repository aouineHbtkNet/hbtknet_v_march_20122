import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';




class PlaceOrder{


  Future  placeOrder( {
    final  List<CartModel>?  cartModeList,
    String? status,
    String? manera_entrega ,
    String? manera_pago ,
    double ? delivery_fee,
    double? grand_delivery_fees_in  ,
    double? grand_total,
    double? grand_total_base,
    double? grand_total_taxes,
    double? grand_total_discount



}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    int? id = await prefs.getInt('id');
    print('sptoken ========================$spToken');

    final url = Uri.parse(
        'http://192.168.1.22/api_v_1/public/client/placeOrder');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',
    };




    Map<String, dynamic> body = {
       'cartModelList': cartModeList,
       'user_id':id,
      'status':status,
      'manera_entrega':manera_entrega,
      'manera_pago': manera_pago,
      'delivery_fee': delivery_fee,
      'grand_delivery_fees_in':grand_delivery_fees_in,
      'grand_total': grand_total,
      'grand_total_base': grand_total_base,
      'grand_total_taxes': grand_total_taxes,
      'grand_total_discount':grand_total_discount
    };


    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    var json = jsonDecode(response.body);
    print ('json=======================$json');

    return  json;
  }









}




