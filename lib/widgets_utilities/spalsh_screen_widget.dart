import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simo_v_7_0_1/constant_strings/user_constant_strings.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';

class SplashScreen extends StatelessWidget {
  static const String id = '/ spalshscreen';


  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
         // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                color: Colors.amberAccent
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(Constants.LOGO_IMAGE,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height/2,
                          ),

                      Text(
                        ' REDES Y APPLICACIONES',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Akaya',
                            fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator( color: Colors.blue,),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),





                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

















