import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:welcome_demo/components/defaul_button.dart';
import 'package:welcome_demo/components/default_textfield.dart';
import 'package:welcome_demo/components/form_error.dart';
import 'package:welcome_demo/screens/home/home.dart';
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
          backgroundColor: Colors.grey[100],
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
          title: Text('LOGIN'),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[100],
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
                                functionValidator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kEmailNullError);
                                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                                    addError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnchanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kEmailNullError);
                                  } else if (emailValidatorRegExp.hasMatch(value)) {
                                    removeError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnSave: (newValue) {
                                  _email = newValue;
                                },
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Container(
                              width: SizeConfig.screenWidth * 0.9,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: DefaultTextfield(
                                isPassword: true,
                                textHint: 'Enter your password',
                                textLabel: 'Password',
                                functionValidator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kPassNullError);
                                  } else if (value.length < 6) {
                                    addError(error: kShortPassError);
                                  }
                                  return null;
                                },
                                functionOnchanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kPassNullError);
                                  } else if (value.length >= 8) {
                                    removeError(error: kShortPassError);
                                  }
                                  return null;
                                },
                                functionOnSave: (newValue) {
                                  _password = newValue;
                                },
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
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
                                  // if (_formKey.currentState.validate()) {
                                  //   _formKey.currentState.save();
                                  //   // if all are valid then go to home screen

                                  // }
                                  setState(() {
                                    onSignIn();
                                  });
                                }),
                            SizedBox(height: getProportionateScreenHeight(100)),
                            Text('Or sign up with social account'),
                            SizedBox(height: SizeConfig.screenHeight * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric( horizontal: 5),
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/google-icon.svg',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric( horizontal: 5),
                                    padding: EdgeInsets.symmetric(vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: SvgPicture.asset(
                                        'assets/icons/facebook-2.svg',
                                        height: 30,
                                        width: 30,
                                      ),
                                    )
                                ),
                              ],
                            ),
                            // Spacer()
                          ],
                        ),
                      ),
                    )))));
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
