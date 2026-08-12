import 'package:flutter/material.dart';
import 'package:minimed/screens/main_screen/main_screen.dart';
import 'package:minimed/screens/welcome_screen/welcome_screen.dart';
import 'package:minimed/screens/auth_screen/auth_screen.dart';
import 'package:minimed/screens/login/login.dart';
import 'package:minimed/screens/registration/registration.dart';
import 'package:minimed/screens/add_new_patient.dart';
import 'package:minimed/screens/add-new-medication.dart';

Map<String, WidgetBuilder> router = {
  WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
  AuthScreen.routeName: (BuildContext context) => AuthScreen(),
  Login.routeName: (BuildContext context) => Login(),
  Registration.routeName: (BuildContext context) => Registration(),
  MainScreen.routeName: (BuildContext context) => MainScreen(),
  AddNewPatient.routeName : (BuildContext context) => AddNewPatient(),
  AddNewMedication.routeName : (BuildContext context) => AddNewMedication(),
};