import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget
{
  DefaultTextfield({Key key, this.textLabel, this.textHint, this.type, this.isPassword, this.functionValidator, this.functionOnchanged, this.functionOnSave}):super(key: key);
  final Function functionValidator;
  final Function functionOnchanged;
  final Function functionOnSave;
  final String textLabel;
  final String textHint;
  final bool isPassword;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: type,
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