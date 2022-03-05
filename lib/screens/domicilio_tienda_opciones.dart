import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/apis/add_to_sharedPrefereces.dart';
import 'package:simo_v_7_0_1/apis/get_user_info.dart';
import 'package:simo_v_7_0_1/apis/placeOrder.dart';
import 'package:simo_v_7_0_1/apis/set_get_sharedPrefrences_functions.dart';
import 'package:simo_v_7_0_1/apis/update_user_to_place_order.dart';
import 'package:simo_v_7_0_1/apis/user_update_fields.dart';
import 'package:simo_v_7_0_1/constant_strings/user_constant_strings.dart';
import 'package:simo_v_7_0_1/modals/admin_login_response_model.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/modals/user_model.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/providers/shared_preferences_provider.dart';
import 'package:simo_v_7_0_1/providers/shared_prefrences_data.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'package:simo_v_7_0_1/widgets_utilities/pop_up_menu_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/spalsh_screen_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/splash_screen_simple.dart';
import 'package:simo_v_7_0_1/widgets_utilities/statefulWidget_textFormField.dart';
import 'package:simo_v_7_0_1/widgets_utilities/stateful_drop_down.dart';

import 'cart_screen.dart';
import 'opcionces_pago.dart';

class DomiclioOTiendaOpciones extends StatefulWidget {
  static const String id = '/ domiclioOTiendaOpciones';

  @override
  State<DomiclioOTiendaOpciones> createState() =>
      _DomiclioOTiendaOpcionesState();
}

class _DomiclioOTiendaOpcionesState extends State<DomiclioOTiendaOpciones> {
  UserModel? userModel;


  void showstuff(context, String  myString) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(myString),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();


                  },
                  child: Center(child: Text('Ok')))
            ],
          );
        });
  }




  @override
  void initState() {
    GetUserInfo().getUserInfo().then((value) {
      setState(() {
        userModel = value;
      });
    });
    super.initState();
  }

  final _placeOrderKey = GlobalKey<FormState>();

  String valueSataus = '';
  String? valueManeraEntrega;
  String? valueManeraPago;
  double valueDeliveryFees = 0.0;
  double valueGrandTotalFees = 0.0;
  String valueNombres = '';
  String valueMobilePhone = '';
  String valueFixedPhone = '';
  String valueEmail = '';
  String valueAddress = '';
  String valueIdentificationId = '';
  List listEntrega = Constants.LIST_MANERA_DE_ENTREGA;
  List listPago = Constants.LIST_MANERA_DE_PAGO;
  bool turnSplash = false;
  resetValues() {
    valueSataus = '';
    valueDeliveryFees = 0.0;
    valueGrandTotalFees = 0.0;
    valueNombres = '';
    valueMobilePhone = '';
    valueFixedPhone = '';
    valueEmail = '';
    valueAddress = '';
    valueIdentificationId = '';
  }


  @override
  Widget build(BuildContext context) {


    var  mapfproducts = context.watch<ShoppingCartProvider>().collectionMap  ;
    var  grandTotal = context.watch<ShoppingCartProvider>().productPriceTotal  ;
    var  grandTotalbase = context.watch<ShoppingCartProvider>().productPrecioSinImpuestoTotal  ;
    var  grandTotalTaxes = context.watch<ShoppingCartProvider>().productValorImpuestoTotal ;
    var  grandTotalDiscount = context.watch<ShoppingCartProvider>().productValorDescuentoTotal  ;





    return userModel==null || turnSplash== true ?

    SplashScreen()

    // height: MediaQuery.of(context).size.height,
    // width: double.infinity,


        :Scaffold(

           // resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      // SizedBox(height: 2.0),
                      PopUpMenuWidget(putArrow: true,

                        callbackArrow: (){
                         Navigator.of(context).pop();},
                        voidCallbackCart: (){
                       Navigator.of(context).pushNamedAndRemoveUntil(UserCart.id, (route) => false);
                        },),

                      SizedBox(height: 20.0),
                      Form(
                        key: _placeOrderKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.0),

                            UsedWidgets().buildTextFormWidgetForText(
                              valueInitial: userModel?.name,
                              label:'Nombre completo',
                              onChanged: (value) {setState(() {valueNombres = value!;});},),

                            SizedBox(height: 20,),
                            UsedWidgets().buildTextFormWidgetForEmail(
                              valueInitial: userModel?.email ?? '',
                              label: 'Email', onChanged: (value) {setState(() {valueEmail = value!;});},),

                            SizedBox(height: 20,),
                            UsedWidgets().buildTextFormWidgetForPhone(
                              valueInitial: userModel?.fixedPhone ?? '', label: 'Teléfono fijo',
                              onChanged: (value) {setState(() {valueMobilePhone = value!;});},),

                            SizedBox(height: 20,),
                            UsedWidgets().buildTextFormWidgetForPhone(
                              valueInitial: userModel?.mobilePhone ?? '', label: 'Teléfono mobil',
                              onChanged: (value) {setState(() {valueFixedPhone = value!;});},),

                            SizedBox(height: 20,),
                            UsedWidgets().buildTextFormWidgetForText(
                              valueInitial: userModel?.address ?? '', label: 'Direccion',
                              onChanged: (value) {setState(() {valueAddress = value!;});},),

                            SizedBox(height: 20,),
                            UsedWidgets().buildTextFormWidgetForText(
                              valueInitial: userModel?.identificationId, label: 'N.identificaion',
                              onChanged: (value) {setState(() {valueIdentificationId = value!;}
                              );
                              },
                            ),




                            SizedBox(height: 20,),
                            UsedWidgets().buildDropDownButtonFixedList(
                                label: 'Escoger la manera de la entrega ', valueInitial: valueManeraEntrega,
                              onChanged:(value) {setState(() {valueManeraEntrega = value!;}
                              );
                              },
                             list: listEntrega),

                            SizedBox(height: 20,),
                            UsedWidgets().buildDropDownButtonFixedList(
                                label: 'Escoger la manera del pago ', valueInitial: valueManeraPago,
                               onChanged:(value) {setState(() {valueManeraPago = value!;}
                               );
                               },  list: listPago),



                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              double?  _deliveryFeeAmount;
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              _deliveryFeeAmount= await prefs.getDouble('deliveryfeeamount');

                              if (_placeOrderKey.currentState!.validate()) {
                                _placeOrderKey.currentState!.save();

                                setState(() {
                                  turnSplash = true;
                                });

                              await UpdateUserToPlaceOrder().updateAllUserInfo(
                                    name: valueNombres== ''? userModel!.name:valueNombres,
                                     email: valueEmail==''?userModel!.email:valueEmail,
                                    mobile_phone: valueMobilePhone==''? userModel!.mobilePhone:valueMobilePhone,
                                    fixed_phone: valueFixedPhone==''?userModel!.fixedPhone:valueFixedPhone,
                                    address: valueAddress ==''?userModel!.address:valueAddress,
                                    identification_id: valueIdentificationId ==''?userModel!.identificationId:valueIdentificationId

                              );




                             UserModel user=  await  GetUserInfo().getUserInfo();

                                SetAndGetSharedPrefrences().setSharedPrefrences(
                                    name: user.name,
                                    email:user.email,
                                    mobilePhone: user.mobilePhone,
                                    fixedPhone: user.fixedPhone,
                                    address: user.address,
                                    identificationNumber:user.identificationId);


                                List<CartModel>  listOfCartModel =[];
                                mapfproducts.forEach((key, value) {
                                  CartModel cartModel =CartModel();
                                  cartModel.product_id=key.id;
                                  cartModel.product_quantity=value;
                                  cartModel.producto_precio_total=key.precio_ahora*value;
                                  cartModel.producto_precio_sinimpuesto_total=key.precio_sin_impuesto*value;
                                  cartModel.producto_valor_impuesto_total=key.valor_impuesto*value;
                                  cartModel.producto_valor_descuento_total=key.valor_descuento*value;
                                  listOfCartModel.add(cartModel);});



                                await  PlaceOrder().placeOrder(
                                    cartModeList: listOfCartModel,
                                    status: valueSataus,
                                    manera_entrega:valueManeraEntrega ,
                                    manera_pago:valueManeraPago ,
                                    delivery_fee: _deliveryFeeAmount,
                                    grand_delivery_fees_in: (double.parse(grandTotal)+ (_deliveryFeeAmount==null?0:_deliveryFeeAmount)),
                                    grand_total:double.parse(grandTotal),
                                    grand_total_base: double.parse(grandTotalbase),
                                    grand_total_taxes: double.parse(grandTotalTaxes),
                                    grand_total_discount:double.parse(grandTotalDiscount)
                                );



                                context.read<ShoppingCartProvider>().resetCollectionMap();

                                resetValues();


                                // Navigator.pop(context);  // pop current page
                                // Navigator.pushNamed(context,DomiclioOTiendaOpciones.id );




                                Navigator.of(context).pushNamedAndRemoveUntil(UserCatalogue.id, (route) => false);

                                setState(() {
                                  turnSplash = false;
                                });

                                showstuff(context, 'Your ordered is received successfully .'
                                    'Puedes seguir mirando la etapa de tu pedido en la area de pedidod');

                              }





















                            }










                            ,
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              primary: Colors.green,
                              onPrimary: Colors.black,
                            ),
                            child: Text(
                              'Pedir un orden',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
