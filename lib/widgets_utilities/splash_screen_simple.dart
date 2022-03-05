
import 'package:flutter/material.dart';

class SpalshscreenSimple extends StatelessWidget {
  static const String id = '/ spalshscreen simple';
  const SpalshscreenSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(

          alignment: Alignment.center,
          color: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: 0.7,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              backgroundColor: Colors.grey,
              minHeight: 14,
            ),
          )
      )
    );
  }
}
