import 'package:flutter/material.dart';
import 'package:welcome_demo/screens/signup/components/body.dart';

import '../../size_config.dart';
class SignUpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('SIGN UP'),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
      ),
      backgroundColor: Colors.grey[100],
      body: Body()
    );

  }
}