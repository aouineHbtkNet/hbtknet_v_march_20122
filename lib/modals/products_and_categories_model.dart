import 'package:simo_v_7_0_1/modals/category_model.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';

class ProductsAndCategories2 {
  List<Product>? productos;
  List<Category>? categorias;

  ProductsAndCategories2({this.productos, this.categorias});

  ProductsAndCategories2.fromJson(Map<String, dynamic> json) {
    if (json['productos'] != null) {
      productos = <Product>[];
      json['productos'].forEach((v) {
        productos!.add(new Product.fromJason(v));
      });
    }
    if (json['categorias'] != null) {
      categorias = <Category>[];
      json['categorias'].forEach((v) {
        categorias!.add(new Category.fromJason(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.productos != null) {
  //     data['productos'] = this.productos!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.categorias != null) {
  //     data['categorias'] = this.categorias!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}