class Category{
  int? id;
  String? nombre_categoria;
  Category();

  factory Category.fromJason(Map<String,dynamic> json){ // Category.fromJason(json['categoria']);
    Category categor=Category();
    categor.id=json['id']  ?? null;
    categor.nombre_categoria=json['nombre_categoria'] ?? null ;
    return categor;
  }







}