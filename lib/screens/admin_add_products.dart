import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/apis/add_to_sharedPrefereces.dart';
import 'package:simo_v_7_0_1/apis/api_add_new_product_admin.dart';
import 'package:simo_v_7_0_1/constant_strings/user_constant_strings.dart';
import 'package:simo_v_7_0_1/modals/json_products_plus_categories.dart';
import 'package:simo_v_7_0_1/providers/provider_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:simo_v_7_0_1/providers/shared_preferences_provider.dart';
import 'package:simo_v_7_0_1/screens/admin_dash_board.dart';

import 'package:simo_v_7_0_1/uploadingImagesAndproducts.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'package:simo_v_7_0_1/widgets_utilities/pop_up_menu_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/spalsh_screen_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/splash_screen_simple.dart';
import 'package:simo_v_7_0_1/widgets_utilities/top_bar_widget_admins.dart';

class AdminAddProduct extends StatefulWidget {
  static const String id = '/HomeForUser';@override _AdminAddProductState createState() => _AdminAddProductState();}

class _AdminAddProductState extends State<AdminAddProduct> {
  final scaffoldKeyUnique = GlobalKey<ScaffoldState>();
//ImagePicker
  File? imageFile;
  void pickupImage(ImageSource source) async {
    try {final imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile == null) return;final imageTemporary = File(imageFile.path);
      setState(() {this.imageFile = imageTemporary;});} on PlatformException catch (e) {print('failed to pick up the image :$e');}}

  //Sheet function
  void showPicker(context) {
    showModalBottomSheet(context: context,
        builder: (context) {return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(leading: new Icon(Icons.photo_camera_outlined),
                title: new Text('Camera'),
                onTap: () {pickupImage(ImageSource.camera);Navigator.pop(context);},),
              ListTile(leading: new Icon(Icons.photo_library_outlined),
                title: new Text('Galeria'), onTap: () {pickupImage(ImageSource.gallery);Navigator.pop(context);},),],);});}

  Widget buildImageContainer() {return Row(children: [
        Container(width: 120, height: 120, child: imageFile != null
                ? ClipOval(child: Image.file(imageFile!, fit: BoxFit.fill,),)
                : ClipRRect(child: Image.asset(Constants.ASSET_PLACE_HOLDER_IMAGE, fit: BoxFit.fill),)),
         SizedBox(width: 20,),
        IconButton( icon:Icon(Icons.edit), onPressed: () { showPicker(context); },),
        SizedBox(width: 20,),
        IconButton(icon: Icon(Icons.clear,  color: Colors.red,), onPressed: () {setState(() {imageFile = null;});},)
      ],);}

  List taxTypesList = ['IVA', 'Impoconsumo', 'Exento'];
  String? selectedCategory;
  String? selectedDiscuento;
  String? selectedTaxType;
  final _formKeyAddProduct = GlobalKey<FormState>();
  String? categoryvalue;
  String messageCategory = '';


  void showTextField(context) {
    showDialog(context: context, builder: (context) {
          return AlertDialog(title: Text('Anadir una categoria nueva'),
            content: TextField(autofocus: true, onChanged: (value) {categoryvalue = value;},),
            actions: [ElevatedButton(onPressed: () async {
                    if (categoryvalue != null) {messageCategory = await ProductUploadingAndDispalyingFunctions().addNewcategory(categoryvalue!);
                      showMessage(context, messageCategory);
                      context.read<ProviderTwo>().initialValues();
                      await context.read<ProviderTwo>().bringproductos();
                    } else {messageCategory = 'El texto es vacio .Intenta de nuevo';
                      showMessage(context, messageCategory);}},
                  child: Text('enviar')),
              ElevatedButton(onPressed: () async {
                    Navigator.of(context).pop();}, child: Text('cancel'))],);});}

  void showMessage(context, String message) {
    showDialog(context: context, builder: (context) {
          return AlertDialog(content: Text(message),
            actions: [ElevatedButton(
                  onPressed: () async {Navigator.of(context).pushNamedAndRemoveUntil(
                        AdminAddProduct.id, (Route<dynamic> route) => false);
                    context.read<ProviderTwo>().initialValues();
                    await context.read<ProviderTwo>().bringproductos();},
                  child: Text('Ok')),],);});}

  bool loading = true;
  bool done = true;
   ProductsAndCategories?  productsAndCategories;
  @override
  void initState() {
     AddProductAdminFunction().getProducts().then((value) {setState(() {productsAndCategories = value;done=true;});});super.initState();}

     TextEditingController controllerNombre =TextEditingController(text: '');
  TextEditingController controllerMarca =TextEditingController();
  TextEditingController controllerContenido =TextEditingController();
  TextEditingController controllerTypoImpuesto =TextEditingController();
  TextEditingController controllerPorcientoDeImpuesto =TextEditingController(text:'0.0');
  TextEditingController controllerPrecio =TextEditingController(text:'0.0');
  TextEditingController controllerPrecioAntes=TextEditingController(text:'0.0');
  TextEditingController controllerDescripcion =TextEditingController();
  @override
  void dispose() {
    controllerNombre.dispose();
    controllerMarca.dispose();
    controllerContenido.dispose();
    controllerTypoImpuesto.dispose();
    controllerPorcientoDeImpuesto.dispose();
    controllerPrecio.dispose();
    controllerPrecioAntes.dispose();
    controllerDescripcion.dispose();
    super.dispose();}
  double  valor_descuento=0.0;
  double  porciento_de_descuento=0.0;
  double valor_impuesto=0.0;
  double precio_sin_impuesto=0.0;

  void calculateProductDynamicvalues ({ double precio_ahora = 0.0 , double 	precio_anterior = 0.0 , double porciento_impuesto=0.0,}){
    precio_anterior>0 &&precio_anterior>precio_ahora?  valor_descuento =   precio_anterior - precio_ahora :0.0;
     precio_anterior>0? porciento_de_descuento = ((precio_anterior - precio_ahora) / precio_anterior) * 100:0.0;
     precio_anterior>0&&porciento_impuesto>0? valor_impuesto = precio_ahora * (porciento_impuesto / 100):0.0;
    precio_sin_impuesto =  precio_ahora - valor_impuesto;}
    @override
  Widget build(BuildContext context) {
    return done==false ? SplashScreen() : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    PopUpMenuWidgetAdmin(putArrow: true, callbackArrow: (){Navigator.of(context).pop();},),
                    Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildImageContainer(),
                        ],
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                      child: Form(key: _formKeyAddProduct,
                                    child: ListView(
                                      children: [
                                        SizedBox(height: 20,),
                                        UsedWidgets().buildDropDownButtonApiList(label:'Escoger una categoria', valueParam: selectedCategory,
                                            onChanged: (value) {setState(() {selectedCategory=value!;});}, list: productsAndCategories?.listOfCategories),
                                        SizedBox(height: 20,),
                                        UsedWidgets().buildTextFormWidgetForTextNoInitial( label: 'Nombre completo', textEditingController: controllerNombre),
                                        SizedBox(height: 20,),
                                        UsedWidgets().buildTextFormWidgetForTextNoInitial(label: 'Marca', textEditingController: controllerMarca),
                                        SizedBox(height: 20,),
                                        UsedWidgets().buildTextFormWidgetForTextNoInitial(label: 'Contenido', textEditingController:controllerContenido),
                                        SizedBox(height: 20,),
                                        UsedWidgets().buildDropDownButtonFixedList(label: 'Escoger el impuesto ', onChanged: (value) { selectedTaxType = value!;}, list: taxTypesList),
                                        SizedBox(height: 20,),
                                        UsedWidgets().buildTextFormWidgetForDoubleNoInitial( label: 'Porciento de impuesto', textEditingController: controllerPorcientoDeImpuesto,),
                                        SizedBox(height: 20,),
                                        UsedWidgets().buildTextFormWidgetForDoubleNoInitial( label: 'Precio', textEditingController: controllerPrecio,),
                                        SizedBox(height: 20,),
                                        UsedWidgets().buildTextFormWidgetForDoubleNoInitial(label: 'Precio antes', textEditingController: controllerPrecioAntes,),
                                        SizedBox(height: 20,),
                                        UsedWidgets().buildTextFormWidgetForTextNoInitial(label:'Descripcion', textEditingController: controllerDescripcion,),
                                        SizedBox(height: 20,),
                                        Padding(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              if (_formKeyAddProduct.currentState!.validate()) {
                                                _formKeyAddProduct.currentState!.save();
                                                  calculateProductDynamicvalues(
                                                  porciento_impuesto:double.parse(controllerPorcientoDeImpuesto.text),
                                                  precio_ahora:double.parse(controllerPrecio.text),
                                                  precio_anterior:double.parse(controllerPrecioAntes.text),);
                                                if (imageFile != null) {
                                                  String message = await AddProductAdminFunction().uploadANewProductWithAnImage(
                                                    imageFile!,
                                                    categoria_id:selectedCategory == null ? '' : selectedCategory!,
                                                    nombre_producto:controllerNombre.text == null ? '' :controllerNombre.text,
                                                    marca:controllerMarca.text == null ? '' :controllerMarca.text,
                                                    contenido:controllerContenido.text == null ? '' :controllerContenido.text,
                                                    typo_impuesto: selectedTaxType == null ? '' : selectedTaxType!,
                                                    porciento_impuesto:controllerPorcientoDeImpuesto.text == null ? '' :controllerPorcientoDeImpuesto.text,
                                                    valor_impuesto: valor_impuesto .toString(),
                                                    precio_ahora:controllerPrecio.text == null ? '' :controllerPrecio.text,
                                                    precio_sin_impuesto:precio_sin_impuesto .toString(),
                                                    precio_anterior:controllerPrecioAntes.text == null ? '' :controllerPrecioAntes.text,
                                                    porciento_de_descuento:porciento_de_descuento.toString(),
                                                    valor_descuento:valor_descuento.toString(),
                                                    descripcion:controllerDescripcion.text == null ? '' :controllerDescripcion.text,);
                                                  showstuff(context, message);}
                                                else {String message = await AddProductAdminFunction().uploadANewProductWithoutImage(
                                                  categoria_id:selectedCategory == null ? '' : selectedCategory!,
                                                  nombre_producto:controllerNombre.text == null ? '' :controllerNombre.text,
                                                  marca:controllerMarca.text == null ? '' :controllerMarca.text,
                                                  contenido:controllerContenido.text == null ? '' :controllerContenido.text,
                                                  typo_impuesto: selectedTaxType == null ? '' : selectedTaxType!,
                                                  porciento_impuesto:controllerPorcientoDeImpuesto.text == null ? '' :controllerPorcientoDeImpuesto.text,
                                                  valor_impuesto: valor_impuesto .toString(),
                                                  precio_ahora:controllerPrecio.text == null ? '' :controllerPrecio.text,
                                                  precio_sin_impuesto:precio_sin_impuesto .toString(),
                                                  precio_anterior:controllerPrecioAntes.text == null ? '' :controllerPrecioAntes.text,
                                                  porciento_de_descuento:porciento_de_descuento.toString(),
                                                  valor_descuento:valor_descuento.toString(),
                                                  descripcion:controllerDescripcion.text == null ? '' :controllerDescripcion.text,);
                                                Navigator.of(context).pop();
                                                // setState(() {loading == false;});
                                                showstuff(context, message);}
                                              }
                                              },
                                            child: Text('Enviar'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.teal,
                                              onPrimary: Colors.white,
                                              onSurface: Colors.grey,
                                            ),),),],),),),
                  ],
                ),
              ),
            ),
          );
  }

  void showstuff(context, String mynotification) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Notification'),
            content: Text(mynotification),
            actions: [
              ElevatedButton(onPressed: () async {Navigator.of(context).pop();},
                  child: Text('Ok'))],);});}
}
