import 'package:flutter/material.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/widget/action_button.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/widget/my_form_field.dart';

class AddNewPatient extends StatelessWidget {
  const AddNewPatient({super.key});
  static const String routeName = '/addnewpatient';

  @override
  Widget build(BuildContext context) {
    return  MainBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Ajouter un nouveau patient",
                style: titleText,
              ),

              const SizedBox(height: 30),

              MyFormField(
                  label: "Nom et prénom",
                  icon: Icons.person_outlined ,
                  isToHide: false
              ),

              MyFormField(
                  label: "Numéro de téléphone",
                  icon: Icons.phone_iphone_outlined,
                  isToHide: false
              ),

              MyFormField(
                label: "Date de naissance",
                icon: Icons.calendar_month_outlined,
                isToHide: false
              ),
              MyFormField(
              label: "Email de contact",
              icon: Icons.email,
              isToHide : false
              ),

              SizedBox(height: 30,),

              ActionButton(
                  label:"Enregistrer",
                  onTap: () {
                              print("ajout d'un nouveau patient");
                            }
              ),
            ],
          ),
        )
    );
  }
}
