import 'package:flutter/material.dart';

class ImagewidgetForCartScreen extends StatelessWidget {
  var networkImageUrl;

  ImagewidgetForCartScreen({Key? key, required this.networkImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return networkImageUrl == null
        ? FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/iconPlaceholder12.png'),
          )
        : FittedBox(
            fit: BoxFit.fill,
            child: ClipRRect(
              child: Image.network(
                  'http://192.168.1.22/api_v_1/storage/app/public/notes/$networkImageUrl'),
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
  }
}
