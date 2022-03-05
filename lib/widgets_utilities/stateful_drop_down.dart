import 'package:flutter/material.dart';


class DropDownWidget extends StatefulWidget {

  static const String id = '/dropdownWidget';


  final String? value;
  final Function(String? value ) onChanged;
  final   String?  Function(String? value ) validateFunction;
  final List list;
  final String label;


  const DropDownWidget({Key? key ,

    this.value,
    required this.onChanged ,
    required this.validateFunction,
    required this.list,
    required this.label



  }) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();

}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField<String>(decoration: InputDecoration( label: Text(widget.label,
      style: TextStyle(fontSize: 18, color: Colors.blue),),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
        value: widget.value,
        onChanged: widget.onChanged,

        validator: widget.validateFunction,
        items: widget.list.map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(
          value: value.toString(),
          child: Text(value.toString()),)).toList());
  }
}
