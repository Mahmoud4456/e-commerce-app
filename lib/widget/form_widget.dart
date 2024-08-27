import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FormItem extends StatelessWidget {
  const FormItem({this.onChange, super.key, this.label,this.type});

  final Function(String)? onChange;
  final TextInputType?  type ;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      onChanged: onChange,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black),
        labelText: label,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
