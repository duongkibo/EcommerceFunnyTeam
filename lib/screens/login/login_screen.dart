import 'dart:convert';
// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:welcome_demo/components/defaul_button.dart';
import 'package:welcome_demo/components/form_error.dart';
import 'package:welcome_demo/screens/home/home.dart';
import 'package:welcome_demo/screens/signup/signup_screen.dart';
import 'package:welcome_demo/size_config.dart';
import '../../constan.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;
  String _tokenFCM = '';
  bool _showPass = false;

  // static String routeName = "/sign_in";
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
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
        ),
        body: SafeArea(
            child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getPropotionateScreenWitdh(20)),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: getProportionateScreenHeight(20)),
                            emailFormField(),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            passwordFormField(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            Container(
                              child: GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Forgot your password?'),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xFFFF7643),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            FormError(errors: errors),
                            SizedBox(height: getProportionateScreenHeight(20)),
                            DefaultButton(
                                text: 'Login',
                                press: () {
                                  setState(() {
                                    onSignIn();
                                  });
                                }),
                            SizedBox(height: getProportionateScreenHeight(20)),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen())),
                              child: Text(
                                "Haven't got an account? Register here!",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(70)),
                            Container(
                              child: Column(
                                children: [
                                  Text('Or login with social account'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RaisedButton(
                                          child: Text('F'), onPressed: () {}),
                                      RaisedButton(
                                          child: Text('G'), onPressed: () {}),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // Spacer()
                          ],
                        ),
                      ),
                    )))));
  }

  TextFormField emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onSaved: (newValue) {
        _email = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      obscureText: !_showPass,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
        } else if (value.length < 6) {
          addError(error: kShortPassError);
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          floatingLabelBehavior: FloatingLabelBehavior.always),
      onSaved: (newValue) {
        _password = newValue;
      },
    );
  }

  Future onSignIn() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final form = _formKey.currentState;
    form.save();

    if (form.validate()) {
      String url =
          'https://app.baomoiday.net/public/api/auth/login?email=$_email&password=$_password';
      var response = await http.post(url);
      if (response.statusCode == 200) {
        Map parsed = json.decode(response.body);
        _tokenFCM = parsed['access_token'];
        if (_tokenFCM != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      }
      if (response.statusCode == 401) {
        return showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                elevation: 3.0,
                actionsOverflowDirection: VerticalDirection.down,
                title: Text(
                  'Login Failed!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Text(
                  'Your email or password is incorrect!\nPlease type again.',
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
