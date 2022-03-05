import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:simo_v_7_0_1/modals/json_products_plus_categories.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';
import 'package:http/http.dart' as http;


enum screenStates {initial,loading,loaded}

class ProductsProvider extends ChangeNotifier{

  screenStates state =screenStates.initial;

    List<Product> productLis=[];
   getProductList()async {
     productLis = await getProductsApi();
     state=screenStates.loaded;
     notifyListeners();

     }


  List  productosJsonList=[];
  getJsonData()async {
    productosJsonList = await getProductsAsJson();
    state=screenStates.loaded;
    notifyListeners();

  }






  Future    getProductsAsJson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    final Map<String, String> _userprofileHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',};
    Uri _tokenUrl = Uri.parse(
        'http://192.168.1.22/api_v_1/public/client/user/showproductsusers');
    http.Response response = await http.post(_tokenUrl, headers: _userprofileHeader);
    var jsondata =  await jsonDecode(response.body);
    var list = await jsondata['productos'] ;

    print ('$list');
    return list ;
  }



  Future<List<Product>>   getProductsApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spToken = await prefs.getString('spToken');
    final Map<String, String> _userprofileHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $spToken',
    };
    Uri _tokenUrl = Uri.parse(
        'http://192.168.1.22/api_v_1/public/client/user/showproductsusers');
    http.Response response =
    await http.post(_tokenUrl, headers: _userprofileHeader);
    var jsondata = jsonDecode(response.body);
    ProductsAndCategories productsAndCategories =ProductsAndCategories.fromjson(jsondata);
    return productsAndCategories.listOfProducts;
  }




}