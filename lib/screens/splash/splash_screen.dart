import 'package:flutter/material.dart';
import 'package:welcome_demo/screens/splash/components/body.dart';
import 'package:welcome_demo/size_config.dart';
class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
     return Scaffold(

      body: Body(),
     );

  }
}
