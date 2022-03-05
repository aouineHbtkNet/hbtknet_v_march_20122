import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/domicilio_tienda_opciones.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';

import 'image_for_cart_screen.dart';
import 'image_widget.dart';

class UsedWidgets {




  Widget buildDropDownButtonTypeOftaxl(
      {
        required String? valueParam,
        required String? Function(String? value) onChanged,
        final List? list,
        final String? label

      }) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          label: Text(
            label ?? '',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),

        value: valueParam ,
        onChanged: onChanged,
        validator: (value) => value == null ? 'Este campo es obligatorio' : null,
        items: list?.map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(
          value: value["id"].toString(),
          child: Text(value["nombre_categoria"].toString()),)).toList());
  }

























  void calculationDiscountAndtaxes(
  {
    double currentPrice = 0.0 ,
    double previousPrice = 0.0 ,
    double discountpercentage = 0.0 ,
    double discountvalue = 0.0 ,
    double taxValue = 0.0 ,
    double priceBase = 0.0 ,


}

      ) {

    // double calculateDiscountPercentage({required double previousPrice ,required double currentprice}) {
    //   return ((previousPrice - currentPrice) / previousPrice) * 100;
    // }


    double calculateDiscountPercentage() {
      return ((previousPrice - currentPrice) / previousPrice) * 100;
    }

    double calculateDiscountvalue({required double previousPrice ,required double currentprice}) {
      return previousPrice - currentPrice;
    }



    double calculateTaxValue({ required double currentPrice, required double taxPercentage}) {
      return currentPrice * (taxPercentage / 100);
    }


    double calculatePriceBase( {  required double currentPrice, required double  resultOfcalculateTaxValueFunction} ) {
      return currentPrice - resultOfcalculateTaxValueFunction;}


  }





























  Widget buildDropDownButtonApiList(
      {
        required String? valueParam,
        required String? Function(String? value) onChanged,
        final List? list,
        final String? label


      }) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          label: Text(
            label ?? '',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),

        value: valueParam ,
        onChanged: onChanged,
        validator: (value) => value == null ? 'Este campo es obligatorio' : null,
        items: list?.map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(
          value: value.id.toString(),
          child: Text(value.nombre_categoria.toString()),)).toList());
  }




  Widget buildDropDownButtonApiListNoModel(
      {

        required String? valueParam,
        required String? Function(String? value) onChanged,
        final List? list,
        final String? label


      }) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          label: Text(
            label ?? '',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        value: valueParam ,
        onChanged: onChanged,
        validator: (value) => value == null ? 'Este campo es obligatorio' : null,
        items: list?.map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(
          value: value['1'].toString(),
          child: Text(value["nombre_categoria"].toString()),)).toList());
  }





































  Widget simpleTitleDataWidget(

  {
    required String title,
    required String data,

}

      ){

    return Column(children: [

      Text(title,style: TextStyle(fontSize: 18 ,fontFamily: 'Arkaya',color: Colors.blueGrey),),
      Text(data,style: TextStyle(fontSize: 24,fontFamily: 'OpenLight'),),


    ],);
  }







  Widget orderDetailsScreenHeading(
  {
    required double sizeTitle,
    required double sizeData,
    required String fontfamilyTitle,
    required String fontFamilyData,

    required String dateData,
    required String orderIdData  ,
    required String serialNumberdata ,
    required String totalPriceData ,
    required String totalPriceBaseData ,
    required String totalPriceTaxesData ,
    required String totalPriceDescountData ,
    //required String totalDelosProductos ,



  }

      ){

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.blueGrey,width: 2)

        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fecha',style: TextStyle(fontSize: sizeTitle ,fontFamily: fontfamilyTitle),),
                Text(dateData,style: TextStyle(fontSize: sizeData,fontFamily: fontFamilyData),),

              ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Numero',style: TextStyle(fontSize: sizeTitle ,fontFamily: fontfamilyTitle),),
                Text(orderIdData,style: TextStyle(fontSize: sizeData,fontFamily: fontFamilyData),),

              ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // trucking_number
                Text('Serial',style: TextStyle(fontSize: sizeTitle ,fontFamily: fontfamilyTitle),),
                Text(serialNumberdata,style: TextStyle(fontSize: sizeData,fontFamily: fontFamilyData),),
              ],),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // trucking_number
                Text('Precio total',style: TextStyle(fontSize: sizeTitle ,fontFamily: fontfamilyTitle),),
                Text(totalPriceData,style: TextStyle(fontSize: sizeData,fontFamily: fontFamilyData,color: Colors.blue),),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // trucking_number
                Text('Precio Base',style: TextStyle(fontSize: sizeTitle ,fontFamily: fontfamilyTitle),),
                Text(totalPriceBaseData,style: TextStyle(fontSize: sizeData,fontFamily: fontFamilyData),),
              ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // trucking_number
                Text('Valor de impuestos ',style: TextStyle(fontSize: sizeTitle ,fontFamily: fontfamilyTitle),),
                Text(totalPriceTaxesData,style: TextStyle(fontSize: sizeData,fontFamily: fontFamilyData),),
              ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // trucking_number
                Text('Valor de descuentos',style: TextStyle(fontSize: sizeTitle ,fontFamily: fontfamilyTitle),),
                Text(totalPriceDescountData,style: TextStyle(fontSize: sizeData,fontFamily: fontFamilyData),),
              ],),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     // trucking_number
            //     Text('Cantidad de productos',style: TextStyle(fontSize: sizeTitle ,fontFamily: fontfamilyTitle),),
            //     Text(totalDelosProductos,style: TextStyle(fontSize: sizeData,fontFamily: fontFamilyData),),
            //   ],),








          ],





          ),
        ),

      ),
    );
  }














  Widget emptyCart(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/cartimage.jpeg'),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              'El carito esta vacio',
              style: TextStyle(
                  color: Colors.black, fontSize: 40, fontFamily: 'OpenLight'),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(UserCatalogue.id);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.green,
            ))
      ],
    );
  }

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

  Widget cartandCounterWidget(
      {required BuildContext context, VoidCallback? callback}) {
    return Stack(
      children: <Widget>[
        Container(
          // color: Colors.blue,
          height: 50.0,
          width: 50.0,
        ),
        Positioned(
          left: 10.0,
          top: 0.0,
          child: Container(
            height: 40.0,
            width: 40.0,
            child: IconButton(
                onPressed: callback,
                icon: Icon(
                  Icons.add_shopping_cart_outlined,
                  size: 50,
                )),
          ),
        ),
        Positioned(
          left: 0.0,
          top: 0.0,
          child: Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                '${context.watch<ShoppingCartProvider>().inCartItemsCount}',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Dancing',
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }

  static Widget buildSpalshScreen() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
          SizedBox(
            height: 40,
          ),
          Text(
            'Loading',
            style: TextStyle(fontSize: 40.0, color: Colors.green),
          )
        ],
      ),
    );
  }

  static Widget spalshScreen = buildSpalshScreen();





  Widget buildDropDownButtonFixedList(
      {
         final String? valueInitial,
      required String? Function(String? value) onChanged,
      final List? list,
      final String? label}) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          label: Text(
            label ?? '',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
       value: valueInitial,
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este campo es obligatorio';
          } else {
            return null;
          }
        },
        items: list!
            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(value.toString()),
                ))
            .toList());
  }










  Widget buildTextFormWidgetForText({
    required String? Function(String? value) onChanged,
    String? valueInitial,
    String? label,
  }) {
    return TextFormField(
      initialValue: valueInitial,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }










 // RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$');

  String? validateDouble(String? value) {
    String pattern =r'\d*\.?\d+';
    RegExp regex = RegExp(pattern);
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }
   else  if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }



  Widget buildTextFormWidgetForDoubleNoInitial({
    required TextEditingController textEditingController,
    String? label,
  }) {
    return TextFormField(
      controller: textEditingController,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator:validateDouble,
      validator:(String? value) {
           String pattern =r'\d*\.?\d+';
            RegExp regex = RegExp(pattern);


            if (value == null || value.trim().isEmpty) {
             return 'Este campo es obligatorio';
           }
            else if (!regex.hasMatch(value))
                 { return 'Ingresa formato valido Ex: 20.00';}
            else
                 return null;
                   },
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

        ),
      ),
    );
  }










  Widget buildTextFormWidgetForDoubleWithInitial({
    String? valueInitial,
    required String? Function(String? value) onChanged,
    String? label,
  }) {
    return TextFormField(
    initialValue:valueInitial ,
     onSaved: onChanged,
      validator:(String? value) {
        String pattern =r'\d*\.?\d+';
        RegExp regex = RegExp(pattern);


        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';
        }
        else if (!regex.hasMatch(value))
        { return 'Ingresa formato valido Ex: 20.00';}
        else
          return null;
      },
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }


















  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
     if (value == null || value.isEmpty || !regex.hasMatch(value))

      return 'Enter a valid email address';
    else
      return null;
  }




  Widget buildTextFormWidgetForEmailNoInitial({
    required TextEditingController textEditingController,
    String? label,
  }) {
    return TextFormField(
      controller: textEditingController,
     // autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateEmail,
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }





















  Widget buildTextFormWidgetForTextNoInitial({
    required TextEditingController textEditingController,
    String? label,
  }) {
    return TextFormField(
     controller: textEditingController,
      // onSaved: onChanged,
      // onFieldSubmitted: onChanged,

      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }









  Widget buildTextFormWidgetForTextWithInitialValue({
    String? valueInitial,
    required String? Function(String? value) onChanged,
    String? label,}) {
    return TextFormField(

    onChanged:onChanged ,
      initialValue: valueInitial,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';} else {
          return null;}},
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }





  Widget buildTextFormWidgetForTextWithInitialValuEditPage({
    required Key key,
    String? valueInitial,
    required String? Function(String? value) onChanged,
    String? label,}) {
    return TextFormField(

        key:key,
      onSaved:onChanged ,
      initialValue: valueInitial,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';} else {
          return null;}},
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

























  Widget buildTextFormWidgetForEmail(
      {required String? Function(String? value) onChanged,
      String? valueInitial,
      String? label}) {
    return TextFormField(
      initialValue: valueInitial,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget buildTextFormWidgetForPhone(
      {required String? Function(String? value) onChanged,
      String? valueInitial,
      String? label}) {
    return TextFormField(
      initialValue: valueInitial,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget buildTextFormWidgetForPassword(
      {required String? Function(String? value) onChanged,
      String? valueInitial,
      String? label}) {
    return TextFormField(
      initialValue: valueInitial,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        label: Text(
          label ?? '',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget addtocartWidget(BuildContext context, Product product) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          context.read<ShoppingCartProvider>().addproductToMap(product);
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.add_shopping_cart_outlined,
                    size: 50,
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget OpciocesPagoWidget({
    required BuildContext context,
    void Function()? callbackEnLinea,
    void Function()? callbackdataFono,
    void Function()? callbackefectivo,
  }) {
    return Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(10.0)),
        child: ExpansionTile(
            title: Text(
              'Escoger una de las opciones ',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            children: [
              ListTile(
                title: Text(
                  'Pagar en linea',
                  style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                ),
                onTap: callbackEnLinea,
              ),
              ListTile(
                  title: Text(
                    'Pagar con datafono',
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                  onTap: callbackdataFono),
              ListTile(
                  title: Text(
                    'Pagar en effectivo',
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                  onTap: callbackefectivo),
            ]));
  }

  Widget OpciocesEntregaWidget(
      {required BuildContext context,
      void Function()? callbackDomicilio,
      void Function()? callbackTienda}) {
    return Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(10.0)),
        child: ExpansionTile(
            title: Text(
              'Escoger una de las opciones ',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            children: [
              ListTile(
                title: Text(
                  'Engtrega a domicilio',
                  style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                ),
                onTap: callbackDomicilio,
              ),
              ListTile(
                  title: Text(
                    'Entraga a la tienda',
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                  onTap: callbackTienda),
            ]));
  }

  Widget totalaPagarWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total a pagar ',
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
            Text(
              '${context.watch<ShoppingCartProvider>().productPriceTotal.toString()}\$',
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }

  Widget placeOrderwidget(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(DomiclioOTiendaOpciones.id);
          },
          style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            primary: Colors.green,
            onPrimary: Colors.black,
          ),
          child: Text(
            'Pedir un orden',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget buildListTile(
      {IconData? leadingIcon, VoidCallback? voidCallback, String? title}) {
    return ListTile(
      onTap: voidCallback,
      leading: Icon(
        leadingIcon,
        color: Colors.amberAccent,
      ),
      title: Text(
        title!,
        style: TextStyle(
            fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildRowNoSpaceScrollable({
    required String title,
    required String data,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.blueGrey),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }




  Widget simpletitleDataPair(){


    return Column(children: [


    ],);


  }















  Widget buildRowSpaceBetween({
    String? title,
    String? data,
    IconData? icon,
    VoidCallback? callback,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                //color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10.0),
             border: Border.all(color: Colors.blueGrey,width: 2)

    ),




            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? '',
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                  IconButton(
                    onPressed: callback,
                    icon: Icon(
                      icon,
                      size: 28,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                data ?? '',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedProduct({
    String? title,
    String? data,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? '',
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                data ?? '',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar({required Function(String? value) callback}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: callback,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Buscar',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

Widget buildplusMinusbtn(BuildContext context, Product product, int quantity) {
  return Row(
    children: [
      InkWell(
          onTap: () {
            context.read<ShoppingCartProvider>().decreaseProductQty(product);
          },
          child: Icon(
            Icons.remove,
            color: Colors.white,
            size: 16,
          )),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), color: Colors.white),
        child: Text(
          quantity.toString(),
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      InkWell(
          onTap: () {
            context.read<ShoppingCartProvider>().addproductToMap(product);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 16,
          )),
    ],
  );
}

class cartproductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final int index;

  const cartproductCard(
      {Key? key,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [

        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blueGrey,width: 2)),

            child: Column(
              children: [
                ImagewidgetForCartScreen(
                  networkImageUrl: product.foto_producto,
                ),

              ],
            ),
          ),
        ),


SizedBox(width: 10,),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blueGrey,width: 2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.nombre_producto.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),


                  Text(
                    '${context.watch<ShoppingCartProvider>().productpricesubTotal[index]}\$ X'
                        ' ${context.watch<ShoppingCartProvider>().inCartItemsList[index]}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),


               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 IconButton(
                   onPressed: () {
                     context
                         .read<ShoppingCartProvider>()
                         .decreaseProductQty(product);
                   },
                   icon: Icon(Icons.remove),
                 ),


                 Text(
                   quantity.toString(),
                   style: TextStyle(color: Colors.black, fontSize: 16),
                 ),





                 IconButton(
                   onPressed: () {
                     context.read<ShoppingCartProvider>().increaseQty(product);
                   },
                   icon: Icon(Icons.add),
                 ),


                 IconButton(
                   onPressed: () {
                     context.read<ShoppingCartProvider>().deleteFromMap(product);
                   },
                   icon: Icon(
                     Icons.clear,
                     color: Colors.red,
                     size: 30,
                   ),
                 ),

               ],)



                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}







class CartTotals extends StatelessWidget {
  const CartTotals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildTotalbars(
                title: 'Total a pagar',
                value: context
                    .watch<ShoppingCartProvider>()
                    .productPriceTotal
                    .toString(),
                color: Colors.blue,
                fontwieght: FontWeight.bold,
              ),
              buildTotalbars(
                title: 'Precio sim impuestos',
                value: context
                    .watch<ShoppingCartProvider>()
                    .productPrecioSinImpuestoTotal
                    .toString(),
              ),
              buildTotalbars(
                title: 'Valor de impuestos',
                value: context
                    .watch<ShoppingCartProvider>()
                    .productValorImpuestoTotal
                    .toString(),
              ),
              buildTotalbars(
                title: 'valor de descuentos',
                value: context
                    .watch<ShoppingCartProvider>()
                    .productValorDescuentoTotal
                    .toString(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class buildTotalbars extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;
  final FontWeight? fontwieght;
  const buildTotalbars(
      {Key? key,
      required this.title,
      required this.value,
      this.color,
      this.fontwieght})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            color: color,
            fontWeight: fontwieght,
          ),
        )
      ],
    );
  }
}


//=========================Validator example=================================


//
// validator:(val){
// if(val.isEmpty){
// return "Required";
// }
// if(val.length < 6){
// return "Password must be atleast 6 characters long";
// }
// if(val.length > 20){
// return "Password must be less than 20 characters";
// }
// if(!val.contains(RegExp(r'[0-9]'))){
// return "Password must contain a number";
// }
// }