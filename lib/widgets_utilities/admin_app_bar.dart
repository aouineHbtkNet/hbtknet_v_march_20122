import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  String mytext;
  bool   yesNoArrow =false;

  AdminAppBar(
      {required this.mytext ,required this.yesNoArrow});
  @override
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderOne>(context);

    return AppBar(
        centerTitle: true,
        title: Text(mytext, style: TextStyle(color: Colors.black, fontSize: 20.0,
            fontFamily: 'font2', fontWeight: FontWeight.w500),),
             automaticallyImplyLeading: yesNoArrow,




        actions: <Widget>[
          PopupMenuButton(
              color: Colors.amberAccent,
              elevation: 20,
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
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String? _Token = await prefs.getString('spToken');
                  print('token ========================$_Token');

                  int? id= await prefs.getInt('id');
                  print('id  ========================$id');

                  String? username= await prefs.getString('username');
                  print('username========================$username');

                  String? email = await prefs.getString('email');
                  print('email ========================$email');


                }








              },
              icon: Icon(Icons.more_vert_rounded),
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text(' Logout', style: TextStyle(color: Colors.black, fontSize: 20.0)), value: 1,),
                    PopupMenuItem(child: Text('profile', style: TextStyle(color: Colors.black, fontSize: 20.0,)), value: 2,),

                  ]),
        ]);
  }
}
