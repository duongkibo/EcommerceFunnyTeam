import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget
{
  DefaultTextfield({Key key, this.function, this.textLabel, this.textHint}):super(key: key);
  final Function function;
  final String textLabel;
  final String textHint;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: TextInputType.text,
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