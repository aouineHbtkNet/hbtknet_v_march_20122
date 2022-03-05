import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simo_v_7_0_1/screens/cart_screen.dart';
import 'package:simo_v_7_0_1/screens/user_orders_screen.dart';
import 'package:simo_v_7_0_1/screens/user_profile_screen.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  String mytext;
  bool arrow =false;

  UserAppBar({
    required this.mytext,

   required this.arrow

  } );
  @override
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderOne>(context);

    return AppBar(
        centerTitle: true,
        title: Text(mytext, style: TextStyle(color: Colors.black, fontSize: 20.0,
             fontWeight: FontWeight.w500),),
        automaticallyImplyLeading: arrow,
        actions: <Widget>[



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [

              Text('${context.watch<ShoppingCartProvider>().inCartItemsCount}',
                style: TextStyle(fontSize: 20),),
              IconButton(onPressed:(){
              Navigator.of(context).pushNamed(UserCart.id);


              }, icon:Icon( Icons.shopping_cart_outlined),
              ),

              PopupMenuButton(

                  color: Colors.amberAccent,
                  elevation: 20,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),

                  onSelected: (value) async {

                    if (value == 1) {await provider.getSPToken();
                    String? token = provider.spToken;
                    await provider.logOutUsers(token ??'empty');
                    print('user with token $token defaulted to empty ');

                    await provider.addTokenToSPA('empty');
                    await provider.getSPToken();
                    String? token2 = provider.spToken;
                    print(" userToken changed to Empty =======================> $token2");
                    Navigator.pushNamed(context, LoginScreen.id);
                    }

                    if (value == 2) {
                     Navigator.of(context).pushNamedAndRemoveUntil(UserProfileScreen.id, (route) => false);

                    }


                    if (value == 3) {
                      Navigator.of(context).pushNamedAndRemoveUntil(UserOrdersScreen.id, (route) => false);

                    }



                  },
                  icon: Icon(Icons.more_vert_rounded),
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text(' Logout', style: TextStyle(color: Colors.black, fontSize: 20.0)), value: 1,),
                    PopupMenuItem(child: Text(' profile', style: TextStyle(color: Colors.black, fontSize: 20.0,)), value: 2,),
                    PopupMenuItem(child: Text(' Mis ordenes', style: TextStyle(color: Colors.black, fontSize: 20.0,)), value: 3,),


                  ]),
            ],
          ),
        ]);
  }
}
