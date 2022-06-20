import 'package:flutter/material.dart';
import 'package:samedaypro/page/dashboard.dart';
import 'package:samedaypro/register.dart';
import 'package:samedaypro/setting.dart';
import 'package:samedaypro/splash_screen.dart';
import 'createticket.dart';
import 'editprofile.dart';
import 'forgetpass.dart';
import 'forgetpass2.dart';
import 'forgetpass3.dart';
import 'helpdesk.dart';
import 'homepage.dart';
import 'login.dart';
import 'loginhome.dart';
import 'otpscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => MyLogin(),
      'loginHome':(context) => LoginHome(),
      'onscreen':(context) => const OtpScreen(),
      'setting' :(context) => const Setting(),
      'forgetpass':(context) => const Forgetpass(),
      'rstpass2' :(context) => const Forgetpass2(),
      'rstsucsses' :(context) => const Forgetpass3(),
      'home' :(context) => HomePage(),
      'dashboard':(context) => Dashboard(),
      'editprofile':(context) => SettingsUI(),
      'helpdek':(context) => HelpDesk(),
      'createticket':(context) => CreateTicket(),
    },
  )
  );



}
