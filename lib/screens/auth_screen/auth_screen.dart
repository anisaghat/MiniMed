import 'package:flutter/material.dart';
import 'package:minimed/widget/navigation_button.dart';
import 'package:minimed/screens/login/login.dart';
import 'package:minimed/screens/registration/registration.dart';
import 'package:minimed/constants/colors.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const String routeName = '/authscreen';


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: welcomeScreenBackground,
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex :4),
            
            NavigationButton(label: "Connexion", page: Login.routeName,
            ),

            const SizedBox(height: 40),
            
            NavigationButton(label: "Inscription", page: Registration.routeName),

            const Spacer(flex:1)
          ],
        )
      )
    );
  }
}
