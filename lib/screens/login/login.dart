import 'package:flutter/material.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/widget/action_button.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/widget/my_form_field.dart';


class Login extends StatelessWidget {
  const Login({super.key});
  static const String routeName = '/login';


  @override
  Widget build(BuildContext context) {
    return
        MainBackground(
            child: Center(
              child : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "Se connecter",
                      style: titleText,
                  ),

                  const SizedBox(height : 30),

                  MyFormField(
                      isToHide : false,
                      label: "Email",
                      icon: Icons.email
                  ),

                  MyFormField(
                      label: "Mot de passe",
                      icon: Icons.lock,
                      isToHide : true,

                  ),

                  SizedBox(
                    height: 30,
                  ),

                  ActionButton(label:"Se connecter", onTap: () {
                    print("CONNEXION");
                  }),
                ],
              )
            )
        )
    ;
  }
}
