import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/apis/future_functions_SP.dart';
import 'package:simo_v_7_0_1/constant_strings/user_constant_strings.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';



class SharedPrefrencedProvider extends ChangeNotifier{









  double  _valor_descuento=0.0;
  double  _porciento_de_descuento=0.0;
  double _valor_impuesto=0.0;
  double _precio_sin_impuesto=0.0;

  void calculateProductDynamicvalues ({ double precio_ahora = 0.0 , double 	precio_anterior = 0.0 , double porciento_impuesto=0.0,}){
     _valor_descuento =   precio_anterior - precio_ahora;
     _porciento_de_descuento =   ((precio_anterior - precio_ahora) / precio_anterior) * 100;
     _valor_impuesto = precio_ahora * (porciento_impuesto / 100);
     _precio_sin_impuesto =  precio_ahora - valor_impuesto;
     notifyListeners();

  }

  double  get   valor_descuento =>  _valor_descuento;
  double   get porciento_de_descuento =>_porciento_de_descuento;
  double  get valor_impuesto  =>_valor_impuesto ;
  double   get precio_sin_impuesto  =>_precio_sin_impuesto;


//price 100
  //previous price 200
  // iva 20
  // 100 valor descuento
  // porciento de descuento  50%
  // valor impuesto 20
  // precio sin impuesto 80































  //variables

  int _userId=0;
  String _userName ='';
  String _userEmail= '';
  String _userMobilePhone ='';
  String _userFixedPhone ='';
  String  _userAddress ='';




  //Getters

  int get userId =>_userId==null?0:_userId;
  String get userName=>_userName ==null?'':_userName;
  String get userEmail => _userEmail ==null ?'':_userEmail;
  String get userMobilePhone => _userMobilePhone==null?'':_userMobilePhone;

  String get userFixedPhone => _userFixedPhone==null?'':_userFixedPhone;
  String  get userAddress =>_userAddress==null ?'':_userAddress;


  // function
  Future  getInstanceOfSP() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = (await prefs.getInt(Constants.USER_ID_KEY ))!;
    _userName = (await prefs.getString(Constants.USER_NAME_KEY))!;
    _userEmail= (await prefs.getString(Constants.USER_EMAIL_KEY))!;
    _userMobilePhone= (await prefs.getString(Constants.USER_MOBILE_PHONE_KEY))!;
    _userFixedPhone= (await prefs.getString(Constants.USER_FIXED_PHONE_KEY))!;
    _userAddress= (await prefs.getString(Constants.USER_ADDRESS_KEY))!;

    notifyListeners();

  }


   Future  setUserName(value)  async{
     SharedPreferences prefs = await SharedPreferences.getInstance();

     prefs.setString(Constants.USER_NAME_KEY,value);
    notifyListeners();
  }

  Future  setUserEmail(value)  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.USER_EMAIL_KEY, value??'');
    notifyListeners();
  }

  Future  setUserMobilePhone(value)  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.USER_MOBILE_PHONE_KEY, value??'');
    notifyListeners();
  }


  Future  setUserFixedPhone(value)  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.USER_FIXED_PHONE_KEY,value??'');
    notifyListeners();
  }


  Future  setUserFixedAddress(value)  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.USER_ADDRESS_KEY,value ??'');
    notifyListeners();
  }











}