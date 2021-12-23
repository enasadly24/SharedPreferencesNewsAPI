
import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  final Function() onPressed;
  FormSubmitButton({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        color: Colors.pink,
        onPressed: onPressed,
        child: Text("submit",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white ),),
      ),
    );
  }
}
