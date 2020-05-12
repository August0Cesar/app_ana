import 'package:flutter/material.dart';

class ImputForm extends StatelessWidget {
  String textFormDefault;
  final controller;

  ImputForm({this.textFormDefault, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: new InputDecoration(
        icon: Icon(Icons.attach_money),
        labelText: textFormDefault,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Email cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }
}
