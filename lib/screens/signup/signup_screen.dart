import 'package:flutter/material.dart';
import 'package:welcome_demo/screens/signup/components/body.dart';

import '../../size_config.dart';
class SignUpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed:() => Navigator.pop(context)
        ),
        title: Text('SIGN UP'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[100],
      ),
      backgroundColor: Colors.grey[100],
      body: Body()
    );

  }
}