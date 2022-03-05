
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/apis/add_to_sharedPrefereces.dart';
import 'package:simo_v_7_0_1/apis/set_get_sharedPrefrences_functions.dart';
import 'package:simo_v_7_0_1/constant_strings/user_constant_strings.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/cart_screen.dart';
import 'package:simo_v_7_0_1/screens/login_screen.dart';
import 'package:simo_v_7_0_1/screens/user_orders_screen.dart';
import 'package:simo_v_7_0_1/screens/user_profile_screen.dart';

import 'multi_used_widgets.dart';


class PopUpMenuWidget extends StatelessWidget {

  bool  putArrow =false;
  final VoidCallback? callbackArrow;
  final VoidCallback? voidCallbackCart;
   PopUpMenuWidget({Key? key ,
    required this.putArrow,
      this.callbackArrow,
       this.voidCallbackCart

  }) : super(key: key);

  @override
  Widget build(BuildContext context ) {


    return   Container(

      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [

            Visibility(
                visible: putArrow,
                child: IconButton(onPressed:callbackArrow, icon: Icon(Icons.arrow_back))),


           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
             UsedWidgets().cartandCounterWidget(context: context,callback: voidCallbackCart),
             SizedBox(width: 10,),
             BuildPopUpMenuWidget()
           ],),

          ]

      ),
    );
}}

class BuildPopUpMenuWidget extends StatelessWidget {
  const BuildPopUpMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderOne>(context);
    return  PopupMenuButton(

         color: Colors.black,
        // elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),

        onSelected: (value) async {

          if (value == 1) {

            await provider.getSPToken();
            String? token = provider.spToken;
            await provider.logoutOutAdmins(token ??'empty');
            print('Admin with token $token defaulted to empty ');

            await provider.addTokenToSPA('empty');
            await provider.getSPToken();

            String? token2 = provider.spToken;
            print(" Admin Token changed to Empty =======================> $token2");
            Navigator.pushNamed(context, LoginScreen.id);

          }

          if (value == 2) {
            Navigator.of(context).pushNamedAndRemoveUntil(UserProfileScreen.id, (route) => false);

          }

          if (value == 3) {
            Navigator.of(context).pushNamedAndRemoveUntil(UserOrdersScreen.id, (route) => false);

          }

        },
        icon: Icon(Icons.more_vert_rounded,size: 40,color: Colors.amber,),
        itemBuilder: (context) => [
          PopupMenuItem(child: Text(' Logout', style: TextStyle(color: Colors.white, fontSize: 20.0)), value: 1,),
          PopupMenuItem(child: Text(' profile', style: TextStyle(color: Colors.white, fontSize: 20.0,)), value: 2,),
          PopupMenuItem(child: Text(' Mis ordenes', style: TextStyle(color: Colors.white, fontSize: 20.0,)), value: 3,),


        ]
    );
  }
}

