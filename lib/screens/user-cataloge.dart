import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:simo_v_7_0_1/apis/getProduct.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/modals/json_products_plus_categories.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';
import 'package:simo_v_7_0_1/providers/provider_two.dart';
import 'package:flutter/material.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/cart_screen.dart';
import 'package:simo_v_7_0_1/screens/selected_product_details.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'package:simo_v_7_0_1/widgets_utilities/pop_up_menu_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/spalsh_screen_widget.dart';

import 'package:simo_v_7_0_1/widgets_utilities/user_app_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserCatalogue extends StatefulWidget {
  const UserCatalogue({Key? key}) : super(key: key);
  static const String id = '/ userpage';
  @override
  State<UserCatalogue> createState() => _UserCatalogueState();
}

class _UserCatalogueState extends State<UserCatalogue> {
  void showstuff(context, var myString) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: myString == null
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

  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = list;
    } else {
      results = list
          .where((element) => element.nombre_producto != null
              ? element.nombre_producto!
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase())
              : false)
          .toList();
    }
    setState(() {
      listOnSearch = results;
    });
  }

  List<Product> listOnSearch = [];
  List<Product> list = [];

  @override
  void initState() {
    GetProduct().getProductsList().then((value) {
      setState(() {
        list = value;
        listOnSearch = list;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list.isEmpty
          // ? SplashScreen()
          ? Text('')
          : SafeArea(
              child: Column(
                children: [
                  PopUpMenuWidget(
                    putArrow: false,
                    voidCallbackCart: () {
                      Navigator.of(context).pushNamed(UserCart.id);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        print(value);
                        _runFilter(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Buscar',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: listOnSearch.isNotEmpty
                        ? ListView.builder(
                            itemCount: listOnSearch.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 20,
                                child: ListTile(
                                  //===========================================================================================
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        SelectedProductDetails.id,
                                        arguments: listOnSearch[index]);
                                  },
                                  leading: TextButton(
                                    onPressed: () {
                                      showstuff(context,
                                          listOnSearch[index].foto_producto);
                                    },
                                    child: Container(
                                        child:
                                            listOnSearch[index].foto_producto ==
                                                    null
                                                ? CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/iconPlaceholder12.png'),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    radius: 30.0,
                                                  )
                                                : CircleAvatar(
                                                    radius: 30.0,
                                                    backgroundImage: NetworkImage(
                                                        'http://192.168.1.22/api_v_1/storage/app/public/notes/${listOnSearch[index].foto_producto}'),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                  )),
                                  ),
                                  title: Column(
                                    children: [
                                      Text(
                                        '${listOnSearch[index].nombre_producto}',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 18),
                                      ),
                                      Text(
                                        '${listOnSearch[index].precio_ahora}\$',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 18),
                                      ),
                                      listOnSearch[index]
                                                  .porciento_de_descuento ==
                                              null
                                          ? Text('')
                                          : Text(
                                              '${listOnSearch[index].porciento_de_descuento}\%',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18),
                                            ),
                                      listOnSearch[index].categoria_id == null
                                          ? Text('')
                                          : Text(
                                              listOnSearch[index]
                                                  .categoria_id
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18),
                                            ),
                                    ],
                                  ),

                                  trailing: Icon(Icons.more_horiz),
                                ),
                              );

//=========================================================== CARD AND EXPANSION TILE END==================================================
                            })
                        : const Text(
                            'No results found',
                            style: TextStyle(fontSize: 24),
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}
