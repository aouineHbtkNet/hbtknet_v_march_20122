import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/apis/get_order_details.dart';
import 'package:simo_v_7_0_1/apis/user_get_orders.dart';
import 'package:simo_v_7_0_1/modals/order_detail_model.dart';
import 'package:simo_v_7_0_1/providers/provider_two.dart';
import 'package:simo_v_7_0_1/providers/shared_preferences_provider.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/pagar_ahora_enLinea.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';
import 'package:simo_v_7_0_1/screens/user_orders_screen.dart';
import 'package:simo_v_7_0_1/widgets_utilities/image_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'package:simo_v_7_0_1/widgets_utilities/pop_up_menu_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/spalsh_screen_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/statefulWidget_textFormField.dart';

import 'cart_screen.dart';


//
// Text(' product_id====== ${listOfItemsIncart[index]['product_id']}'),
// Text(' getPRODUCTS====== ${listOfItemsIncart[index]["get_products"]['nombre_producto']}'),
// Text(' product quamtity =======${listOfItemsIncart[index]['qty']}'),
// Text(' product price ====${listOfItemsIncart[index]['product_total_price']}'),
// SizedBox(height: 20,)

class UserOrdersDetailsScreen extends StatefulWidget {
  static const String id = '/userorderDetailsScreen';



  @override
  State<UserOrdersDetailsScreen> createState() => _UserOrdersDetailsScreenState();
}

class _UserOrdersDetailsScreenState extends State<UserOrdersDetailsScreen> {

 List listOfItemsIncart=[];





 // @override
 //  void didChangeDependencies() {
 //   selectedProduct = ModalRoute.of(context)!.settings.arguments ;
 //   GetOrdersDetails().getOrderDetails(order_id).then((value) {
 //
 //     listOfItemsIncart= value;
 //     setState(() {
 //
 //     });
 //   });
 //    super.didChangeDependencies();
 //  }
  var selectedProduct;
 int  order_id=0;
  @override
  Widget build(BuildContext context)  {


    selectedProduct = ModalRoute.of(context)!.settings.arguments ;

       order_id =selectedProduct['id'];

      print(' selected product=======================${selectedProduct}');





    return Scaffold(
      
        body: order_id == 0?
        Center(child: CircularProgressIndicator()):
        SafeArea(
          child: Column(
            children: [

              PopUpMenuWidget(putArrow: true,
                callbackArrow: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(UserOrdersScreen.id,
                          (Route<dynamic> route) => false);},
                voidCallbackCart: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(UserCart.id,
                          (Route<dynamic> route) => false);
                },),

              Padding(
                padding: const EdgeInsets.all(6.0),
                child: UsedWidgets().orderDetailsScreenHeading(

                  sizeTitle:18 ,
                  sizeData: 30,
                  fontfamilyTitle:'Opendark',
                  fontFamilyData:'Dancing' ,
                  dateData:'${selectedProduct['created_at']}',
                  orderIdData: '${selectedProduct['id']}',
                  serialNumberdata:'${selectedProduct['trucking_number']}',
                  totalPriceData:'${selectedProduct['grand_total']}',
                  totalPriceBaseData: '${selectedProduct['grand_total_base']}',
                  totalPriceTaxesData:'${selectedProduct['grand_total_taxes']}',
                  totalPriceDescountData: '${selectedProduct['grand_total_discount']}',
                  // totalDelosProductos:  '${selectedProduct['id']}'
                ),
              ),


              Container(
                decoration: BoxDecoration(

                    border: Border.all(color: Colors.blueGrey,width: 2),
                    borderRadius: BorderRadius.circular(4.0)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('La lista de los productos :',style: TextStyle(fontSize: 20),),
                ),
              ),



              Expanded(

                child: Container(
                 // color: Colors.amberAccent,
                  child: FutureBuilder(
                    future:GetOrdersDetails().getOrderDetails(order_id ) ,
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                      return  snapshot.hasData?ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                        // color: Colors.greenAccent,
                            child: Column(children: [







                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                 Text('Numero : ',style: TextStyle(fontSize: 18 ,fontFamily: 'Arkaya',color: Colors.blueGrey),),
                                 Text('${ index+1}',style: TextStyle(fontSize: 24,fontFamily: 'OpenLight'),),

                               ],),
                             ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(color: Colors.blue,thickness: 2,),
                              ),



                              ImagewidgetNoButton(
                              networkImageUrl:snapshot.data[index].getProducts.fotoProducto,
                            ),

                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'Nombre : ',
                                  data:' ${snapshot.data[index].getProducts.nombreProducto}'),

                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'Contenido : ',
                                  data:' ${snapshot.data[index].getProducts.contenido}'),




                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'Precio unitario : ',
                                  data:' ${snapshot.data[index].getProducts.precioAhora}'),

                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'Precio Base unitario : ',
                                  data:' ${snapshot.data[index].getProducts.precioSinImpuesto}'),
                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'Precio antes unitario  : ',
                                  data:' ${snapshot.data[index].getProducts.precioAnterior}'),
                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'Porciento de desuento unitario : ',
                                  data:' ${snapshot.data[index].getProducts.porcientoDeDescuento}'),
                              UsedWidgets().simpleTitleDataWidget(
                                  title: ' Valor de descuento  unitario : ',
                                  data:' ${snapshot.data[index].getProducts.valorDescuento}'),

                              UsedWidgets().simpleTitleDataWidget(
                                  title: ' cantidad : ',
                                  data:' ${snapshot.data[index].qty}'),




                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'valor total  del precio  : ',
                                  data:' ${snapshot.data[index].productTotalPrice}'),

                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'valor total  del precio base: ',
                                  data:' ${snapshot.data[index].productTotalBase}'),
                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'Valor total de los impuestos: ',
                                  data:' ${snapshot.data[index].productTotalTaxes}'),
                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'Valor total de los discuentos: ',
                                  data:' ${snapshot.data[index].productTotalDiscount}'),













                              UsedWidgets().simpleTitleDataWidget(
                                  title: 'Descripcion : ',
                                  data:' ${snapshot.data[index].getProducts.descripcion}'),











                          ],) ,),
                        );





                      },):Center(child: CircularProgressIndicator());


                    },
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }
}
