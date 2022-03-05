import 'package:flutter/material.dart';


class TextFormFieldWidget extends StatefulWidget {

  static const String id = '/textFormFieldWidget';
  Function(String? value ) onChanged;
 // final   String?  Function(String? value ) validateFunction;
   String labelText;
   String? initialValue;



   TextFormFieldWidget({Key? key ,

    required this.onChanged ,
   //  required this.validateFunction,
    required this.labelText,
    required this.initialValue,



  }) : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();

}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
    initialValue: widget.initialValue,


      // onChanged:widget.onChanged,

    onChanged:widget.onChanged,





     // validator:widget.validateFunction,

      decoration: InputDecoration(

        label: Text(widget.labelText
          , style: TextStyle(fontSize: 20, color: Colors.blue),),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),);
  }
}


//implementation of this multiused widget


//
// Form(
// key: _formX,
// child: Column(
// children: [
// TextFormFieldWidget(
// callback: (value) {
//
// valueX = value;
// },
// callback2: (value) {
// if (value == null || value.trim().isEmpty) {
// return 'Este campo es obligatorio';
// } else {
// return null;
// }
// },
// ),
// ],
// ),
// ),
// IconButton(
// onPressed: () {
// if (_formX.currentState!.validate()) {
// _formX.currentState!.save();
// }
// },
// icon: Icon(Icons.graphic_eq_outlined))







