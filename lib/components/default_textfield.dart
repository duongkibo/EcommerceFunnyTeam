import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget
{
  DefaultTextfield({Key key, this.function, this.textLabel, this.textHint, this.isPassword}):super(key: key);
  final Function function;
  final String textLabel;
  final String textHint;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: TextInputType.text,
      obscureText: isPassword,
      autocorrect: false,
      onSaved: function,
      onChanged: function,
      validator: function,
      decoration: InputDecoration(
          labelText: textLabel,
          hintText: textHint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none
      ),
    );
  }
}