
import 'dart:convert';

import 'package:http/http.dart' as http;

class CheckoutPayement {

  static Uri _tokenUrl = Uri.parse('https://api.sandbox.checkout.com/tokens');
  static Uri _payementUrl =
  Uri.parse('https://api.sandbox.checkout.com/payments');

  static const String _publickey =
      'pk_test_d9b1feb2-e26c-4ab8-8c59-8e7759573ffd';
  static const String _secretkey =
      'sk_test_72decbe0-342a-4fc9-868c-20626fe1527b';

  static const Map<String, String> _tokenHeader = {
    'Content-Type': 'application/json',
    'Authorization': _publickey,
  };
  static const Map<String, String> _payementnHeader = {
    'Content-Type': 'application/json',
    'Authorization': _secretkey,
  };

//====================================================GetToken=============================

  // Future<String> getToken(PayementCard card) async {
  //   Map<String, String> body = {
  //     'type': 'card',
  //     'number': card.number,
  //     'expiry_month': card.expiry_month,
  //     'expiry_year': card.expiry_year,
  //   };
  //
  //   http.Response response = await http.post(_tokenUrl,
  //       headers: _tokenHeader, body: jsonEncode(body));
  //
  //   if (response.statusCode == 201) {
  //     var data = jsonDecode(response.body);
  //     return data['token'];
  //   } else {
  //     throw Exception('invalid card');
  //   }
  // }
  //

  //====================================================Getpayement============================

  //
  // Future<bool> getPayement(PayementCard card, int amount) async {
  //   String token = await getToken(card);
  //   print(token);
  //
  //   Map<String, dynamic> body = {
  //     'source': {
  //       'type': 'token',
  //       'token': token,
  //     },
  //     'amount': amount,
  //     'currency': 'USD',
  //   };
  //
  //   http.Response response = await http.post(_payementUrl,
  //       headers: _payementnHeader, body: jsonEncode(body));
  //
  //   if (response.statusCode == 201) {
  //     var data = jsonDecode(response.body);
  //     print(data['response_summary']);
  //     return true;
  //   } else {
  //     throw Exception('Payement failed');
  //   }
  // }







}