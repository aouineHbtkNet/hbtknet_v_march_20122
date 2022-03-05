import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/constant_strings/user_constant_strings.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/modals/order_detail_model.dart';




class GetOrdersDetails{


  Future < List<OrderDetailModel>>  getOrderDetails(
      int orderId
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    int? id = await prefs.getInt('id');
    print('sptoken ========================$spToken');
    print('id ========================$id');






    final url = Uri.parse('http://192.168.1.22/api_v_1/public/client/get_user_order_details');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',
    };
    Map<String, dynamic> body = {
      'user_id':id,
      'order_id':orderId,
    };
    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    // var jsondata = jsonDecode(response.body);

      var jsonData = jsonDecode(response.body) as List;
      List<OrderDetailModel> list =jsonData.map((product) =>OrderDetailModel.fromJson(product)).toList();


    print ('list   in the order number =======================$list ');
    print ('list   in the order number =======================${list[0].productTotalBase} ');



    return list ;
  }

}

