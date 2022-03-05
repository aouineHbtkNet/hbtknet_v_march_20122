import 'package:flutter/material.dart';


class ImagewidgetNoButton extends StatelessWidget {


   var networkImageUrl;

   ImagewidgetNoButton({Key? key,

    required this.networkImageUrl

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  networkImageUrl ==  null
        ? Container(
          height: 50,
          width: 50,
          child: Image.asset('assets/iconPlaceholder12.png'),
        )
        : Container(

      height: MediaQuery.of(context).size.height / 3,
          child: FittedBox(
      fit: BoxFit.fill,
      child: ClipRRect(
          child: Image.network(
              'http://192.168.1.22/api_v_1/storage/app/public/notes/$networkImageUrl'),
          borderRadius:
          BorderRadius.circular(10.0),
      ),
    ),
        );

  }
}
