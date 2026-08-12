import 'package:flutter/material.dart';
import 'package:minimed/screens/main_screen/main_screen.dart';
import 'package:minimed/screens/welcome_screen/welcome_screen.dart';
import 'package:minimed/router/router.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: router,
      initialRoute: MainScreen.routeName,
    );
  }
}
