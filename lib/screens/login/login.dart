import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/widget/action_button.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/widget/my_form_field.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  String? errorMessage;

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
                      icon: Icons.email,
                      onChanged: (value) { email = value;},
                  ),

                  MyFormField(
                      label: "Mot de passe",
                      icon: Icons.lock,
                      isToHide : true,
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

                  ActionButton(label:"Se connecter", onTap: () async
                  {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if(!context.mounted) return;
                      Navigator.pushNamed(context, '/mainscreen');
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        switch (e.code) {
                          case 'user-not-found':
                            errorMessage = "user was not found";
                            break;
                          case 'wrong-password':
                            errorMessage = "password is not correct";
                            break;
                          case 'invalid-email':
                            errorMessage = 'invalid email';
                            break;
                          case 'invalid-credential':
                            errorMessage = 'invalid credential';
                            break;
                          default:
                            errorMessage = 'Erreur lors de la connexion.';
                        }
                      });
                    }

                  }),
                ],
              )
            )
        )
    ;
  }
}
