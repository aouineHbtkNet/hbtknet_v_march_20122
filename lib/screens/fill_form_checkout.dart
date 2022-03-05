import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simo_v_7_0_1/modals/admin_login_response_model.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/login_screen.dart';

import 'package:simo_v_7_0_1/screens/user-cataloge.dart';
import 'admin_dash_board.dart';






String selectedDocument ='Cédula de ciudadanía (CC)';
List<String> listOfDocuments =['Cédula de ciudadanía (CC)','Cédula de extranjería (CE)','Cédula de identidad (CI)','Pasaporte','Otros'];

class FormForPagarContraEntrega extends StatefulWidget {
  static const String id = '/FormForPagarContraEntrega';

  @override
  State<FormForPagarContraEntrega> createState() => _FormForPagarContraEntregaState();
}

class _FormForPagarContraEntregaState extends State<FormForPagarContraEntrega> {
  TextEditingController _fullNameController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  TextEditingController _selectedDocumentController = TextEditingController();
  TextEditingController _selectedPhoenController = TextEditingController();


  final _formforCheckout = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('LLenar este formulario por favor', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [




              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key:_formforCheckout,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [




                        SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.name, textInputAction: TextInputAction.done,
                          controller: _fullNameController,
                          validator: (value) {if (value == null || value.trim().isEmpty) {return 'Este campo es obligatorio';}
                          else {return null;}},
                          decoration: InputDecoration(hintText: 'Nombre completo', label: Text('Nombre completo',
                            style: TextStyle(fontSize: 20, color: Colors.blue),),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),),
                        SizedBox(height: 14,),
                        TextFormField(
                          keyboardType: TextInputType.name, textInputAction: TextInputAction.done,
                          controller: _addressController,
                          validator: (value) {if (value == null || value.trim().isEmpty) {return 'Este campo es obligatorio';}
                          else {return null;}},
                          decoration: InputDecoration(hintText: 'Direccion', label: Text('Direccion',
                            style: TextStyle(fontSize: 20, color: Colors.blue),),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),),
                        SizedBox(height: 14,),

                        DropdownButtonFormField<String>(
                            decoration: InputDecoration(hintText: 'Escoger el typo de documento',
                          label: Text('Typo de documento', style: TextStyle(fontSize: 20, color: Colors.blue),
                          ), border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                            value: selectedDocument,

                            onChanged: (value) {selectedDocument = value!;
                            setState(() {

                            });},

                            items: listOfDocuments.map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(value: value.toString(),
                              child: Text(value.toString()),)).toList()),
                        SizedBox(height: 20,),


                     TextFormField(
                          keyboardType: TextInputType.name, textInputAction: TextInputAction.done,
                          controller: _selectedDocumentController,
                          validator: (value) {if (value == null || value.trim().isEmpty) {return 'Este campo es obligatorio';}
                          else {return null;}},
                          decoration: InputDecoration(hintText: 'Numero del document', label: Text('Numero del document',
                            style: TextStyle(fontSize: 20, color: Colors.blue),),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),),
                        SizedBox(height: 10,),




                        TextFormField(
                          keyboardType: TextInputType.number, textInputAction: TextInputAction.done,
                          controller: _selectedPhoenController,
                          validator: (value) {if (value == null || value.trim().isEmpty) {return 'Este campo es obligatorio';}
                          else {return null;}},
                          decoration: InputDecoration(hintText: 'Numero del celular', label: Text('Numero del celular',
                            style: TextStyle(fontSize: 20, color: Colors.blue),),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),),
                        SizedBox(height: 10,),








                        ElevatedButton(
                          onPressed:() async{

                          if(_formforCheckout.currentState!.validate()) {



                          }},

                          style: ElevatedButton.styleFrom(primary: Colors.amber,),

                          child: Text('Enviar ', style: TextStyle(fontSize: 24)),),

                      ],
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

