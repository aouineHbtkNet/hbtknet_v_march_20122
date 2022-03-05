import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/apis/user_get_orders.dart';
import 'package:simo_v_7_0_1/providers/shared_preferences_provider.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/pagar_ahora_enLinea.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'package:simo_v_7_0_1/widgets_utilities/pop_up_menu_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/statefulWidget_textFormField.dart';

import 'cart_screen.dart';
import 'order_details_screen.dart';

class UserOrdersScreen extends StatefulWidget {
  static const String id = '/UserOrderScreen';

  @override
  State<UserOrdersScreen> createState() => _UserOrdersScreenState();
}

class _UserOrdersScreenState extends State<UserOrdersScreen> {
  List ordersList = [];
  @override
  void initState() {
    GetOrdersUser().getOrdersUser( ).then((value) {
      setState(() {
        ordersList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SafeArea(
              child: Column(

                children: [

                  PopUpMenuWidget(putArrow: true,
                    callbackArrow: (){
                      Navigator.of(context).pushNamedAndRemoveUntil(UserCatalogue.id,
                              (Route<dynamic> route) => false);},
                    voidCallbackCart: (){
                      Navigator.of(context).pushNamedAndRemoveUntil(UserCart.id,
                              (Route<dynamic> route) => false);
                    },),







                  ordersList.isEmpty
                      ?Center(child: Text('No hay pedidos',style: TextStyle(fontSize: 40,fontFamily: 'Dancing',color: Colors.blueGrey),))
                      : Expanded(
                    child: ListView.builder(
                        itemCount: ordersList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Id :' ,style: TextStyle(fontSize: 20),),
                                        Text(ordersList[index]['id'].toString() ,style: TextStyle(fontSize: 20),),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Serial :' ,style: TextStyle(fontSize: 20),),
                                        Text(ordersList[index]['trucking_number'].toString() ,style: TextStyle(fontSize: 20),),
                                      ],
                                    ),
                                  ),



                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Manera de Entrega :' ,style: TextStyle(fontSize: 20),),
                                        ordersList[index]['manera_entrega']==null?Text(''): Text(ordersList[index]['manera_entrega'].toString() ,style: TextStyle(fontSize: 20),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Manera de pago :' ,style: TextStyle(fontSize: 20),),
                                        ordersList[index]['manera_pago']==null?Text(''): Text(ordersList[index]['manera_pago'].toString() ,
                                          style: TextStyle(fontSize: 20),),
                                      ],
                                    ),


                                  ),







                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Fecha :' ,style: TextStyle(fontSize: 20),),
                                        Text(ordersList[index]['created_at'] ,style: TextStyle(fontSize: 20),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total a pagar :' ,style: TextStyle(fontSize: 20),),
                                        Text(ordersList[index]['grand_total'] ,style: TextStyle(fontSize: 20),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Status:' ,style: TextStyle(fontSize: 20 ),),
                                        ordersList[index]['status']==null?Text(''): Text(ordersList[index]['status'] ,
                                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,
                                              color: Colors.green,fontFamily: 'OpenLight'),),
                                      ],
                                    ),
                                  ),





                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){Navigator.of(context).pushNamed(UserOrdersDetailsScreen.id,
                                    arguments: ordersList[index]);},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Mas Detailles',style: TextStyle(color:Colors.blueGrey,
                                        fontSize: 20,fontFamily: 'OpenDark'),),
                                   SizedBox(width: 10,),
                                   Icon(Icons.more_horiz_outlined,size: 20,color:Colors.green)
                                  ],
                                ),
                              ),







                            ) ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ));
  }
}
