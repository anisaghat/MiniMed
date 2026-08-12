import 'package:flutter/material.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/widget/action_button.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/widget/my_form_field.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});
  static const String routeName = '/registration';


  @override
  Widget build(BuildContext context) {
    return MainBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Créer un nouveau compte",
                style: titleText,
            ),

            const SizedBox(height : 30),

            MyFormField(
                isToHide : false,
                label:"Nom d'utilisateur",
                icon:Icons.person
            ),

            MyFormField(
                isToHide : false,
                label: "Email",
                icon: Icons.email
            ),

            MyFormField(
                isToHide : true,
                label: "Mot de passe",
                icon: Icons.lock
            ),

            MyFormField(
                isToHide : true,
                label: "Confirmer le mot de passe",
                icon: Icons.lock
            ),

            SizedBox(
              height: 30,
            ),

            ActionButton(label:"S'inscrire", onTap: () {
              print("INSCRIPTION");
            }),
          ],
        ),
      ),
    );
  }
}
