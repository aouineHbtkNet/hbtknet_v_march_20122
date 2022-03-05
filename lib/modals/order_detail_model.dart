class OrderDetailModel {
  int? orderId;
  int? productId;
  int? userId;
  int? qty;
  String? productTotalPrice;
  String? productTotalBase;
  String? productTotalTaxes;
  String? productTotalDiscount;
  GetProducts? getProducts;

  OrderDetailModel(
      {this.orderId,
        this.productId,
        this.userId,
        this.qty,
        this.productTotalPrice,
        this.productTotalBase,
        this.productTotalTaxes,
        this.productTotalDiscount,
        this.getProducts});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    productId = json['product_id'];
    userId = json['user_id'];
    qty = json['qty'];
    productTotalPrice = json['product_total_price'];
    productTotalBase = json['product_total_base'];
    productTotalTaxes = json['product_total_taxes'];
    productTotalDiscount = json['product_total_discount'];
    getProducts = json['get_products'] != null
        ? new GetProducts.fromJson(json['get_products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['qty'] = this.qty;
    data['product_total_price'] = this.productTotalPrice;
    data['product_total_base'] = this.productTotalBase;
    data['product_total_taxes'] = this.productTotalTaxes;
    data['product_total_discount'] = this.productTotalDiscount;
    if (this.getProducts != null) {
      data['get_products'] = this.getProducts!.toJson();
    }
    return data;
  }
}

class GetProducts {
  int? id;
  Null? fotoProducto;
  String? nombreProducto;
  String? marca;
  String? contenido;
  String? typoImpuesto;
  String? porcientoImpuesto;
  String? valorImpuesto;
  String? precioAhora;
  String? precioSinImpuesto;
  String? precioAnterior;
  String? porcientoDeDescuento;
  String? valorDescuento;
  String? descripcion;
  Null? categoriaId;

  GetProducts(
      {this.id,
        this.fotoProducto,
        this.nombreProducto,
        this.marca,
        this.contenido,
        this.typoImpuesto,
        this.porcientoImpuesto,
        this.valorImpuesto,
        this.precioAhora,
        this.precioSinImpuesto,
        this.precioAnterior,
        this.porcientoDeDescuento,
        this.valorDescuento,
        this.descripcion,
        this.categoriaId});

  GetProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fotoProducto = json['foto_producto'];
    nombreProducto = json['nombre_producto'];
    marca = json['marca'];
    contenido = json['contenido'];
    typoImpuesto = json['typo_impuesto'];
    porcientoImpuesto = json['porciento_impuesto'];
    valorImpuesto = json['valor_impuesto'];
    precioAhora = json['precio_ahora'];
    precioSinImpuesto = json['precio_sin_impuesto'];
    precioAnterior = json['precio_anterior'];
    porcientoDeDescuento = json['porciento_de_descuento'];
    valorDescuento = json['valor_descuento'];
    descripcion = json['descripcion'];
    categoriaId = json['categoria_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foto_producto'] = this.fotoProducto;
    data['nombre_producto'] = this.nombreProducto;
    data['marca'] = this.marca;
    data['contenido'] = this.contenido;
    data['typo_impuesto'] = this.typoImpuesto;
    data['porciento_impuesto'] = this.porcientoImpuesto;
    data['valor_impuesto'] = this.valorImpuesto;
    data['precio_ahora'] = this.precioAhora;
    data['precio_sin_impuesto'] = this.precioSinImpuesto;
    data['precio_anterior'] = this.precioAnterior;
    data['porciento_de_descuento'] = this.porcientoDeDescuento;
    data['valor_descuento'] = this.valorDescuento;
    data['descripcion'] = this.descripcion;
    data['categoria_id'] = this.categoriaId;
    return data;
  }
}