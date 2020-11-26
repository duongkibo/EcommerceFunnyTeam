import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:welcome_demo/components/defaul_button.dart';
import 'package:welcome_demo/components/default_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:welcome_demo/screens/login/login_screen.dart';
import '../../../components/form_error.dart';
import '../../../constan.dart';
import '../../../size_config.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String email;
  String phone;
  String password;
  String name;
  String address;
  bool remember = false;


  final _formKey = GlobalKey<FormState>();
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
        children: <Widget>[
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
                    removeError(error: kNamelNullError);
                  }
                  name = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: kNamelNullError);
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
                    removeError(error: kInvalidEmailError);
                  }
                  email = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: kEmailNullError);
                  } else if (emailValidatorRegExp.hasMatch(value)) {
                    removeError(error: kInvalidEmailError);
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
                    removeError(error: kPhoneNumberNullError);
                  }
                  phone = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: kPhoneNumberNullError);
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
                    removeError(error: kAddressNullError);
                  }
                  address = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: kAddressNullError);
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
                    removeError(error: kPassNullError);
                  }
                  password = value;
                },
                functionValidator: (value) {
                  if (value.isEmpty) {
                    addError(error: kPassNullError);
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
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
            width: SizeConfig.screenWidth * 0.9,
            child: DefaultButton(
                text: "SIGN UP",
                press: () {
                  setState(() {
                    onSignUp();
                  });
                }
            ),
          ),
        ],
      ),
    );
  }

  Future onSignUp() async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // if all are valid then go to home screen
    }
    if(_formKey.currentState.validate()){
      String url = 'http://app.baomoiday.net/public/api/auth/create?reg_email=$email&reg_password=$password&reg_first_name=$name&reg_address1=$address&reg_phone=$phone';
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(<String, String>{
          'reg_first_name': name,
          'reg_email': email,
          'reg_password': password,
          'reg_address1': address,
          'reg_phone': phone,
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
      if (response.statusCode == 401) {
        return showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                elevation: 3.0,
                actionsOverflowDirection: VerticalDirection.down,
                title: Text(
                  'Sign Up Failed!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Text(
                  'Your informations is incorrect!\nPlease type again.',
                  textAlign: TextAlign.justify,
                  softWrap: true,
                ),
                actions: [
                  FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK',
                          style: TextStyle(color: Color(0xFFFF7643))))
                ],
              );
            });
      }
    }
  }
}