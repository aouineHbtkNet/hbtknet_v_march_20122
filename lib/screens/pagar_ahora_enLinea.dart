import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';

class PagarAhoraEnLinea extends StatelessWidget {
  const PagarAhoraEnLinea({Key? key}) : super(key: key);
  static const String id = '/ PagarAhoraEnlinea';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.greenAccent,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Pagar en linea'),
          ),
          body:Container(
            child:Center(child: Text('En construccion',style: TextStyle(fontSize: 40,color: Colors.blueGrey),))
          )
        ));
  }
}

