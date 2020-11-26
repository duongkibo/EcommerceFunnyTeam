import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget
{
  DefaultTextfield({Key key, this.textLabel, this.textHint, this.isPassword, this.functionValidator, this.functionOnchanged, this.functionOnSave}):super(key: key);
  final Function functionValidator;
  final Function functionOnchanged;
  final Function functionOnSave;
  final String textLabel;
  final String textHint;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: TextInputType.text,
      obscureText: isPassword,
      autocorrect: false,
      onSaved: functionOnSave,
      onChanged: functionOnchanged,
      validator: functionValidator,
      decoration: InputDecoration(
          labelText: textLabel,
          hintText: textHint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none
      ),
    );
  }
}