import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simo_v_7_0_1/modals/admin_login_response_model.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/login_screen.dart';


import 'admin_dash_board.dart';


class RegisterNewAdmins extends StatelessWidget {
  static const String id = '/registerNewAdmins';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKeyForRegisterNewAdminsAndusers = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderOne>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key:_formKeyForRegisterNewAdminsAndusers,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Crear un admin nuevo', style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.name, textInputAction: TextInputAction.done,
                      controller: _nameController,
                      validator: (value) {if (value == null || value.trim().isEmpty) {return 'Este campo es obligatorio';}
                      else {return null;}},
                      decoration: InputDecoration(hintText: 'Nombre completo', label: Text('Nombre completo',
                        style: TextStyle(fontSize: 20, color: Colors.blue),),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),),
                    SizedBox(height: 14,),
                    TextFormField(
                      keyboardType: TextInputType.name, textInputAction: TextInputAction.done,
                      controller: _emailController,
                      validator: (value) {if (value == null || value.trim().isEmpty) {return 'Este campo es obligatorio';}
                      else if (value.isEmpty || !value.contains('@')) {return "Entrada invalida.Ex:example@example.com";}
                      else {return null;}},
                      decoration: InputDecoration(hintText: 'Email', label: Text('Email',
                        style: TextStyle(fontSize: 20, color: Colors.blue),),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),),
                    SizedBox(height: 14,),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text, textInputAction: TextInputAction.done,
                      controller: _passwordController,
                      validator: (value) {if (value == null || value.trim().isEmpty) {return 'Este campo es obligatorio';}
                      else {return null;}},
                      decoration: InputDecoration(hintText: 'Contrasena', label: Text('Contrasena',
                        style: TextStyle(fontSize: 20, color: Colors.blue),),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),),
                    SizedBox(height: 10,),


                    ElevatedButton(
                      onPressed:() async{
                        if (_formKeyForRegisterNewAdminsAndusers.currentState!.validate()) {
                          LoginResponseDataModel adminLoginResponse = LoginResponseDataModel();
                          adminLoginResponse = await ProviderOne().registerAdmins(_nameController.text, _emailController.text, _passwordController.text);
                          await provider.addTokenToSPA(adminLoginResponse.token);
                          await provider.addUserIdToSPA(adminLoginResponse.id);
                          await provider.addUserNameToSPA(adminLoginResponse.name);
                          await provider.addUserEmailToSPA(adminLoginResponse.email);
                          Navigator.pushNamed(context, AdminDashBoard.id);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Container(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Hola ${adminLoginResponse.name}',style: TextStyle(fontSize: 16.0,color: Colors.black),),
                                  Text(adminLoginResponse.message,style: TextStyle(fontSize: 16.0,color: Colors.black),),
                                ],
                              ),
                            ),
                            duration: Duration(milliseconds: 8000),
                            backgroundColor: Colors.amberAccent,
                            padding: EdgeInsets.all(10),
                            elevation: 20,));

                        }

                      },

                      style: ElevatedButton.styleFrom(primary: Colors.amber,),

                      child: Text('Enviar ', style: TextStyle(fontSize: 24)),),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed:() async{Navigator.pushNamed(context, LoginScreen.id);},
                      style: ElevatedButton.styleFrom(primary: Colors.amber,),
                      child: Text('Crear una cuenta nueva ', style: TextStyle(fontSize: 24 ,),),
                    ),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}

