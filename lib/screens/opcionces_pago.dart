import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simo_v_7_0_1/apis/placeOrder.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';
import 'package:simo_v_7_0_1/providers/shared_preferences_provider.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/pagar_ahora_enLinea.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';

List<CartModel> list=[];

class  OpcionesDePago extends StatelessWidget {
  const OpcionesDePago({Key? key}) : super(key: key);
  static const String id = '/OpcionesDePago';


  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<SharedPrefrencedProvider>(context, listen: false);
    provider.getInstanceOfSP();
    int? userId = context.watch<SharedPrefrencedProvider>().userId;

    var  mapfproducts = context.watch<ShoppingCartProvider>().collectionMap  ;
    var  grandTotal = context.watch<ShoppingCartProvider>().productPriceTotal  ;
    var  grandTotalbase = context.watch<ShoppingCartProvider>().productPrecioSinImpuestoTotal  ;
    var  grandTotalTaxes = context.watch<ShoppingCartProvider>().productValorImpuestoTotal ;
    var  grandTotalDiscount = context.watch<ShoppingCartProvider>().productValorDescuentoTotal  ;





    return Container(
        color: Colors.greenAccent,
        child: Scaffold(
          appBar: AppBar(
            title: Text(''),
          ),
          body: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UsedWidgets().totalaPagarWidget(context),
                UsedWidgets().OpciocesPagoWidget(
                    context: context,
                   callbackEnLinea: (){



                      Navigator.of(context).pushNamed(PagarAhoraEnLinea.id);},









                   callbackdataFono: () async{


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

                      PlaceOrder().placeOrder(
                          cartModeList: listOfCartModel,











                          grand_total:double.parse(grandTotal),
                          grand_total_base: double.parse(grandTotalbase),
                          grand_total_taxes: double.parse(grandTotalTaxes),
                          grand_total_discount:double.parse(grandTotalDiscount)
                      );















                     }







    ,
                  callbackefectivo: (){},



                   ),










              ],
            ),
          ),
        ));
  }
}