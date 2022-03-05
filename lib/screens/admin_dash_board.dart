import 'package:simo_v_7_0_1/widgets_utilities/admin_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'admin_accounts.dart';
import 'admin_add_new_admins.dart';
import 'admin_inventory.dart';
import 'domicilio_tienda_opciones.dart';




InkWell myItem(
    VoidCallback voidCallback, IconData icon, String heading) {
  return InkWell(
    onTap: voidCallback,
    child: Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.green,
      borderRadius: BorderRadius.circular(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, size: 50.0, color: Colors.amber),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              heading,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0,color: Colors.blue,),
            ),
          ),


        ],
      ),
    ),
  );
}

class AdminDashBoard extends StatefulWidget {
  static const String id = '/ dashboardForAdmins';
  @override
  _AdminDashBoardState createState() => _AdminDashBoardState();
}
class _AdminDashBoardState extends State<AdminDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AdminAppBar(mytext: '',yesNoArrow: false,),
        body: Container(
            margin: EdgeInsets.all(10.0),
            child: Center(
              child:ListView(

                  children: <Widget>[
                    UsedWidgets().buildListTile(leadingIcon:Icons.food_bank,
                      voidCallback: (){Navigator.of(context).pushNamed(AdminInventory.id);},title: 'Inventario',),

                    UsedWidgets().buildListTile(leadingIcon:Icons.account_box_outlined,
                      voidCallback: (){Navigator.of(context).pushNamed(AdminManagingAccounts.id);},title: 'Cuentas',),

                    UsedWidgets().buildListTile(leadingIcon:Icons.account_balance_wallet,
                      voidCallback: (){},title: 'Ordenes',),



                  ]),
            )));}
}
