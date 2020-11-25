import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:welcome_demo/components/defaul_button.dart';
import 'package:welcome_demo/screens/signup/components/sign_up_form.dart';
import 'package:welcome_demo/size_config.dart';


import '../../../constan.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(vertical: getPropotionateScreenWitdh(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
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
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}