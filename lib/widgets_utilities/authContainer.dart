import 'package:simo_v_7_0_1/screens/admin_dash_board.dart';
import 'package:simo_v_7_0_1/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({Key? key}) : super(key: key);
  @override
  _AuthContainerState createState() => _AuthContainerState();
}
class _AuthContainerState extends State<AuthContainer> {
bool initial =true;
String accessToken ='empty';
String table='empty';

  @override
  Widget build(BuildContext context) {




    if (initial) {
      SharedPreferences.getInstance().then((sharedPrefvalue){
        setState(() {
          initial =false;
          accessToken  = sharedPrefvalue.getString('spToken') ?? 'empty';
          table  = sharedPrefvalue.getString('table') ?? 'empty';
          print ('  From AuthContainer============== token ===========>  $accessToken');
          print ('  From AuthContainer================  table===========>  $table');
        });
      });
      return Scaffold(
          body: Center(child: CircularProgressIndicator()));

    }else{

       if(accessToken!='empty' && table=='user'){ return UserCatalogue();}  // original

      if(accessToken!= 'empty'&& table=='admin'){ return AdminDashBoard();}
       else { return LoginScreen();}

    }






















    // if (initial) {
    //   SharedPreferences.getInstance().then((sharedPrefvalue){
    //     setState(() {
    //       initial =false;
    //       accessToken  = sharedPrefvalue.getString('spToken') ?? 'empty';
    //       table  = sharedPrefvalue.getString('table') ?? 'empty';
    //       print ('  From AuthContainer============== token ===========>  $accessToken');
    //       print ('  From AuthContainer================  table===========>  $table');
    //     });
    //   });
    //   return Scaffold(
    //       body: Center(child: CircularProgressIndicator()));
    //
    // }else{
    //
    //   if( accessToken=='empty')
    //   { return LoginScreen();}
    //   else
    //     { return AdminDashBoard();}
    //
    // }

  }
}
