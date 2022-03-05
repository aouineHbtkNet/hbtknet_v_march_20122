import 'package:simo_v_7_0_1/modals/product_model.dart';

class CartModel{

      int? product_id;
      int? product_quantity ;
      double? producto_precio_total=0.0;
     double? producto_precio_sinimpuesto_total=0.0;
     double? producto_valor_impuesto_total =0.0;
     double? producto_valor_descuento_total =0.0;









CartModel({

  this.product_id,
  this.product_quantity,
  this.producto_precio_total,
 this.producto_precio_sinimpuesto_total,
 this.producto_valor_impuesto_total,
   this.producto_valor_descuento_total

});






      Map<String,dynamic> toJson(){

        final Map<String,dynamic> data = new  Map<String,dynamic>();

        data['product_id']= this.product_id;
        data['product_quantity']= this.product_quantity;
        data['producto_precio_total']=   this.producto_precio_total;
        data['producto_precio_sinimpuesto_total']=   this.producto_precio_sinimpuesto_total;
        data['producto_valor_impuesto_total']=   this.producto_valor_impuesto_total;
        data['producto_valor_descuento_total']=   this.producto_valor_descuento_total;


        return data;
      }





















}






