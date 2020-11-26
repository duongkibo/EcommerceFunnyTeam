import 'package:flutter/material.dart';
import 'package:welcome_demo/components/defaul_button.dart';

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
  String conform_password;
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
              width: SizeConfig.screenWidth*0.9,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: buildNameFormField()),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
              width: SizeConfig.screenWidth*0.9,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: buildEmailFormField()),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
              width: SizeConfig.screenWidth*0.9,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: buildPasswordFormField()),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
              width: SizeConfig.screenWidth*0.9,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: buildPhoneFormField()),
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
            width: SizeConfig.screenWidth*0.9,
            child: DefaultButton(
              text: "SIGN UP",
              press: () {}
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'Sai');
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: 'Sai');
        }
        conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: 'kPassNullError');
          return "";
        } else if ((password != value)) {
          addError(error: 'kMatchPassError');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: InputBorder.none
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'kPassNullError');
        } else if (value.length >= 8) {
          removeError(error: 'kShortPassError');
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: 'kPassNullError');
          return "";
        } else if (value.length < 8) {
          addError(error: 'kShortPassError');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: InputBorder.none,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'kEmailNullError');
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: 'kEmailNullError');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: InputBorder.none,
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      autocorrect: false,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'kEmailNullError');
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: 'kEmailNullError');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone",
        hintText: "Enter your phone",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: InputBorder.none,
      ),
    );
  }
}