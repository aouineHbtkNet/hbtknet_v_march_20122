import 'dart:async';
import 'package:flutter/services.dart';
import 'package:simo_v_7_0_1/providers/products_provider.dart';
import 'package:simo_v_7_0_1/providers/provider_two.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/providers/shared_preferences_provider.dart';
import 'package:simo_v_7_0_1/providers/shared_prefrences_data.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/admin_accounts.dart';
import 'package:simo_v_7_0_1/screens/admin_add_new_admins.dart';
import 'package:simo_v_7_0_1/screens/admin_dash_board.dart';
import 'package:simo_v_7_0_1/screens/admin_add_products.dart';
import 'package:simo_v_7_0_1/screens/admin_show_products_edit_delet.dart';
import 'package:simo_v_7_0_1/screens/admin_edit_product.dart';
import 'package:simo_v_7_0_1/screens/cart_screen.dart';
import 'package:simo_v_7_0_1/screens/fill_form_checkout.dart';
import 'package:simo_v_7_0_1/screens/domicilio_tienda_opciones.dart';
import 'package:simo_v_7_0_1/screens/opcionces_pago.dart';
import 'package:simo_v_7_0_1/screens/order_details_screen.dart';
import 'package:simo_v_7_0_1/screens/pagar_ahora_enLinea.dart';
import 'package:simo_v_7_0_1/screens/selected_product_details.dart';
import 'package:simo_v_7_0_1/screens/user_orders_screen.dart';
import 'package:simo_v_7_0_1/screens/user_profile_screen.dart';
import 'package:simo_v_7_0_1/screens/user_register_new_users.dart';
import 'package:simo_v_7_0_1/screens/admin_inventory.dart';
import 'package:simo_v_7_0_1/screens/login_screen.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';
import 'package:simo_v_7_0_1/widgets_utilities/authContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simo_v_7_0_1/widgets_utilities/on_generate_routes.dart';
import 'package:simo_v_7_0_1/widgets_utilities/spalsh_screen_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/splash_screen_simple.dart';
import 'package:simo_v_7_0_1/widgets_utilities/statefulWidget_textFormField.dart';

import 'apis/add_to_sharedPrefereces.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(MultiProvider(
    providers: [ //SpData
      ChangeNotifierProvider<ProviderOne>(create: (_) => ProviderOne()),
      ChangeNotifierProvider<ProviderTwo>(create: (_) => ProviderTwo()),
      ChangeNotifierProvider<ShoppingCartProvider>(create: (_) => ShoppingCartProvider()),
      ChangeNotifierProvider<SharedPrefrencedProvider>(create: (_) => SharedPrefrencedProvider()),


    ],



    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return GestureDetector(


      onTap: (){

        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }




      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'hHBTKNET',
        theme: ThemeData(
          // fontFamily: ' Open',

          appBarTheme: AppBarTheme(
            color:Colors.amberAccent,


          ),

          brightness: Brightness.light,
          primaryColor: Colors.amberAccent,
          primarySwatch: Colors.blue,
        ),


         initialRoute: AdminDashBoard.id ,// ===============> original
        // initialRoute:   SplashScreen.id,


        // initialRoute: AddProduct.id ,
        // onGenerateRoute: (parameterthatcarryingdataintheroute){
        //
        // if(parameterthatcarryingdataintheroute.name == DetailsOfProducto.id)// this is the condition to navigate to one route which is here :DetailsOfProducto.id
        //
        //   {
        // var   data =  parameterthatcarryingdataintheroute.arguments ; // puting the data sent in a variable type var named data
        //   return MaterialPageRoute(builder: (context)=>DetailsOfProducto(data: data,));// returning data inside the constructor}// },

      //
      //   onGenerateRoute: (parameterthatcarryingdataintheroute){
      //
      //   if(parameterthatcarryingdataintheroute.name ==  UserOrdersDetailsScreen.id)// this is the condition to navigate to one route which is here :DetailsOfProducto.id
      //
      //     {
      //   var   data =  parameterthatcarryingdataintheroute.arguments ; // puting the data sent in a variable type var named data
      //     return MaterialPageRoute(
      // builder: (context)=> UserOrdersDetailsScreen(listOfItemsIncart1: [],) ););
      //
      //   }

        onGenerateRoute:RouteGenerator.generateRoute,


        routes: {

          LoginScreen.id: (context) => LoginScreen(),
          AdminAddProduct.id: (context) => AdminAddProduct(),
          AdminDashBoard.id:(context)=>AuthContainer(),
          AdminInventory.id:(context)=>AdminInventory(),
          RegisterNewUsers.id:(context)=>RegisterNewUsers(),
          AdminEditProduct.id:(context)=>AdminEditProduct(),
          AdminShowProductsEditDelete.id:(context)=>AdminShowProductsEditDelete(),
          UserCatalogue.id:(context)=>UserCatalogue(),
          RegisterNewAdmins.id:(context)=>RegisterNewAdmins(),
          AdminManagingAccounts.id:(context)=>AdminManagingAccounts(),
          UserCart.id:(context)=>UserCart(),
          SelectedProductDetails.id:(context)=>SelectedProductDetails(),
          PagarAhoraEnLinea.id:(context)=>PagarAhoraEnLinea(),
          FormForPagarContraEntrega.id:(context)=>FormForPagarContraEntrega(),
          UserProfileScreen.id:(context)=>UserProfileScreen(),
          DomiclioOTiendaOpciones.id:(context)=>DomiclioOTiendaOpciones(),
          OpcionesDePago.id:(context)=>OpcionesDePago(),
          UserOrdersScreen.id:(context)=>UserOrdersScreen(),
          SplashScreen.id:(context)=>SplashScreen(),
          SpalshscreenSimple.id:(context)=> SpalshscreenSimple(),
          UserOrdersDetailsScreen.id:(context)=>UserOrdersDetailsScreen(),






        },
      ),
    );
  }
}



