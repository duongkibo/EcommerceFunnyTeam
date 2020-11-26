import 'package:flutter/material.dart';
import 'package:welcome_demo/components/defaul_button.dart';
import 'package:welcome_demo/components/default_textfield.dart';

import '../../../size_config.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String phone;
  String password;
  String name;
  String address;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
              width: SizeConfig.screenWidth * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DefaultTextfield(
                type: TextInputType.text,
                isPassword: false,
                textHint: 'Enter your name',
                textLabel: 'Name',
                functionOnSave: (newValue) => name = newValue,
                functionOnchanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: 'Sai');
                  }
                  name = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: 'kPassNullError');
                    return "";
                  }
                  return null;
                },
              )),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
              width: SizeConfig.screenWidth * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DefaultTextfield(
                type: TextInputType.emailAddress,
                isPassword: false,
                textHint: 'Enter your email',
                textLabel: 'Email',
                functionOnSave: (newValue) => email = newValue,
                functionOnchanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: 'Sai');
                  }
                  email = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: 'kPassNullError');
                    return "";
                  }
                  return null;
                },
              )),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
              width: SizeConfig.screenWidth * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DefaultTextfield(
                type: TextInputType.number,
                isPassword: false,
                textHint: 'Enter your phone',
                textLabel: 'Phone',
                functionOnSave: (newValue) => phone = newValue,
                functionOnchanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: 'Sai');
                  }
                  phone = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: 'kPassNullError');
                    return "";
                  }
                  return null;
                },
              )),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
              width: SizeConfig.screenWidth * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DefaultTextfield(
                type: TextInputType.text,
                isPassword: false,
                textHint: 'Enter your address',
                textLabel: 'address',
                functionOnSave: (newValue) => address = newValue,
                functionOnchanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: 'Sai');
                  }
                  address = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: 'kPassNullError');
                    return "";
                  }
                  return null;
                },
              )),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
              width: SizeConfig.screenWidth * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DefaultTextfield(
                type: TextInputType.text,
                isPassword: false,
                textHint: 'Enter your password',
                textLabel: 'Password',
                functionOnSave: (newValue) => password = newValue,
                functionOnchanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: 'Sai');
                  }
                  password = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: 'kPassNullError');
                    return "";
                  }
                  return null;
                },
              )),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  print('Alreadly hava an account');
                },
                child: Text('Alreadly hava an account ?'),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
            width: SizeConfig.screenWidth * 0.9,
            child: DefaultButton(
                text: "SIGN UP",
                press: () {}
            ),
          ),
        ],
      ),
    );
  }
}