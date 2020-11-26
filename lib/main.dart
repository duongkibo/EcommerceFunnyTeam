import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:welcome_demo/screens/splash/splash_screen.dart';
import 'constan.dart';
import 'package:flutter/services.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

          primaryColorLight: KPrimaryColor,
          accentColor: KPrimaryColor,
          primaryColor: KPrimaryColor,
          primaryColorDark: KPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Muli",
          textTheme: TextTheme(bodyText1: TextStyle(color: kTextColor),
                                bodyText2: TextStyle(color: kTextColor))),
      home: SplashScreen(),
    );
  }
}
