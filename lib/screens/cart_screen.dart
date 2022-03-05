import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'package:simo_v_7_0_1/widgets_utilities/pop_up_menu_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/user_app_bar.dart';


class UserCart extends StatefulWidget {
  const UserCart({Key? key}) : super(key: key);
  static const String id = '/ usercart';
  @override
  _UserCartState createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  @override
  Widget build(BuildContext context) {

    int mapOfproductslength = context.watch<ShoppingCartProvider>().countMap;
    var mapOfproducts = context.watch<ShoppingCartProvider>().collectionMap;



    print(mapOfproductslength);
    print(mapOfproducts);

    return Scaffold(

      body: SafeArea(


        child: mapOfproducts.isEmpty?

        UsedWidgets().emptyCart( context)

            :Column(
          children: [




            PopUpMenuWidget(putArrow: true,

              callbackArrow: (){
                Navigator.of(context).pushNamedAndRemoveUntil(UserCatalogue.id,
                        (Route<dynamic> route) => false);},
              voidCallbackCart: (){

              },),

            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                  itemCount: mapOfproducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cartproductCard(
                      product: mapOfproducts.keys.toList()[index],
                      quantity: mapOfproducts.values.toList()[index],
                      index: index,
                    );
                  }),
            ),


            UsedWidgets().placeOrderwidget(context),
           CartTotals()



          ],
        ),
      ),
    );
  }
}
