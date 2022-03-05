import 'package:simo_v_7_0_1/modals/category_model.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';

class ProductsAndCategories{

List<Category> listOfCategories=[];
List<Product> listOfProducts =[];

  ProductsAndCategories();


  factory  ProductsAndCategories.fromjson(Map<String,dynamic> json){
      ProductsAndCategories productsAndCategories =ProductsAndCategories();



        for( var c  in json['categorias']   ){
        Category temp =Category.fromJason(c);
        productsAndCategories.listOfCategories.add(temp);
      }

     for( var p  in json['productos']    ){
        Product temp =Product.fromJason(p);
        productsAndCategories.listOfProducts.add(temp);
      }

     return productsAndCategories;
  }
}