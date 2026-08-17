import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/screens/main_screen/main_screen.dart';
import 'package:minimed/widget/action_button.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/widget/my_form_field.dart';

class Registration extends StatefulWidget {

  const Registration({super.key});
  static const String routeName = '/registration';

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  String username = "";
  String email = "";
  String password = "";
  String? errorMessage;

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
                icon:Icons.person,
                onChanged: (value) {username = value;},
            ),

            MyFormField(
                isToHide : false,
                label: "Email",
                icon: Icons.email,
                onChanged: (value) { email = value;},

            ),

            MyFormField(
                isToHide : true,
                label: "Mot de passe",
                icon: Icons.lock,
                onChanged: (value) { password = value;},
            ),

            errorMessage == null
                ? const SizedBox.shrink()
                : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            ActionButton(label:"S'inscrire", onTap: () async {
              try
                  {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                    if(!context.mounted) return;
                    Navigator.pushNamed(context, MainScreen.routeName);
                  } on FirebaseAuthException catch (e) {
                setState(() {
                  switch (e.code) {
                    case 'email-already-in-use':
                      errorMessage = "this email is already used";
                      break;
                    case 'invalid-email':

                      errorMessage = "email is not valid";
                      break;
                    case 'weak-password':

                      errorMessage =
                      "password is too weak lil bro make it harder";
                      break;
                    default :
                      errorMessage = "an error has come idk why";
                  }
                });

              }

            }),
          ],
        ),
      ),
    );
  }
}
