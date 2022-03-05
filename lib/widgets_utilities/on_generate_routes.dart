import 'package:flutter/material.dart';
import 'package:simo_v_7_0_1/screens/admin_edit_product.dart';
import 'package:simo_v_7_0_1/screens/error_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == AdminEditProduct.id) {
      var data = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => AdminEditProduct(selectedproduct: data,categoryList: data,),
      );
    }
    return MaterialPageRoute(builder: (context) => ErrorScreen());
  }
}
