import 'package:flutter/material.dart';

class MyFormTextField extends StatelessWidget {
  Function(String) onSaved;
  InputDecoration decoration;
  Function(String) validator;
  final bool isObscure;
  TextEditingController controller;
  MyFormTextField({this.onSaved, this.decoration,this.validator,this.isObscure,this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isObscure,
        decoration: decoration,
        validator: validator,
        onSaved: onSaved,
        controller: controller
    );
  }
}