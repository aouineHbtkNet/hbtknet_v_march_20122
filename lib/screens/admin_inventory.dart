import 'package:simo_v_7_0_1/screens/admin_add_products.dart';
import 'package:flutter/material.dart';
import 'package:simo_v_7_0_1/widgets_utilities/admin_app_bar.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'admin_show_products_edit_delet.dart';
class AdminInventory extends StatelessWidget {
  static const String id = '/admininventory';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AdminAppBar(mytext: 'Inventory',yesNoArrow: true,),
        body: Container(
            margin: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    UsedWidgets().buildListTile(leadingIcon: Icons.add,
                        voidCallback: (){Navigator.pushNamed(context, AdminAddProduct.id);},title: 'anadir un producto nuevo'),
                    UsedWidgets().buildListTile(leadingIcon: Icons.edit,voidCallback: (){Navigator.pushNamed(context, AdminShowProductsEditDelete.id);},title: 'Editar y borrar productos'),
                    UsedWidgets().buildListTile(leadingIcon: Icons.graphic_eq_outlined,voidCallback: (){},title: 'Estadísticas'),

                  ]
              ),
            )
        )
    );
  }
}
