import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';
import 'package:simo_v_7_0_1/widgets_utilities/image_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'package:simo_v_7_0_1/widgets_utilities/pop_up_menu_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/user_app_bar.dart';

import 'cart_screen.dart';

class SelectedProductDetails extends StatefulWidget {
  const SelectedProductDetails({Key? key}) : super(key: key);
  static const String id = '/ selectedProductDetails';
  @override
  _SelectedProductDetailsState createState() => _SelectedProductDetailsState();
}

void showstuff(context, var myString) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: myString == '' || myString == null
              ? ClipRect(
                  child: Image.asset('assets/iconPlaceholder12.png'),
                )
              : ClipRect(
                  child: Image.network(
                      'http://192.168.1.22/api_v_1/storage/app/public/notes/$myString'),
                ),
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

var selectedProduct;
int quantityLocal = 1;

class _SelectedProductDetailsState extends State<SelectedProductDetails> {
  @override
  Widget build(BuildContext context) {
    selectedProduct = ModalRoute.of(context)!.settings.arguments as Product;
    var mymap = context.watch<ShoppingCartProvider>().collectionMap;




    return selectedProduct == null
        ? Text('Loading')
        : Scaffold(
            body: SafeArea(
            child: Column(children: [
              PopUpMenuWidget(
                putArrow: true,
                callbackArrow: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      UserCatalogue.id, (Route<dynamic> route) => false);
                },
                voidCallbackCart: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      UserCart.id, (Route<dynamic> route) => false);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ImagewidgetNoButton(
                          networkImageUrl: selectedProduct.foto_producto,
                        ),

                        UsedWidgets().buildSelectedProduct(
                            title: 'Categoria',
                            data: '${selectedProduct.marca}'),





                        UsedWidgets().buildSelectedProduct(
                            title: 'Marca',
                            data: '${selectedProduct.marca}'),


                        UsedWidgets().buildSelectedProduct(
                            title: 'Nombre',
                            data: '${selectedProduct.nombre_producto}'),

                        UsedWidgets().buildSelectedProduct(
                            title: 'Contenido',
                            data: '${selectedProduct.nombre_producto}'),





                        UsedWidgets().buildSelectedProduct(
                            title: 'Precio',
                            data: '${selectedProduct.precio_ahora}\$' ),
                        selectedProduct.precio_anterior == null
                            ? Text('')
                            : UsedWidgets().buildSelectedProduct(
                                title: 'precio antes',
                                data:
                                    '${selectedProduct.precio_anterior}\$' ),
                        selectedProduct.precio_anterior == null
                            ? Text('')
                            : UsedWidgets().buildSelectedProduct(
                                title: 'Descuento',
                                data:
                                    '${selectedProduct.porciento_de_descuento}\%'),
                        UsedWidgets().buildSelectedProduct(
                            title: 'descripcion',
                            data: '${selectedProduct.descripcion}' ),
                      ],
                    )),
                  ),
                ),
              ),
              UsedWidgets().addtocartWidget(context, selectedProduct),
            ]),
          ));
  }
}
