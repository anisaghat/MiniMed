import 'package:firestore_odm/firestore_odm.dart';
import 'package:dto/schema.dart';
import 'package:dto/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/constants/sizes.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/screens/main_screen/main_screen.dart';
import 'package:minimed/widget/action_button.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/widget/my_form_field.dart';

class AddNewPatient extends StatefulWidget {
  final Patient? patientToEdit;

  const AddNewPatient({super.key, this.patientToEdit});
  static const String routeName = '/addnewpatient';

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  DateTime? dateOfBirth;
  String email = "";
  String gender = "";

  @override
  void initState() {
    super.initState();

    final patient = widget.patientToEdit;

    if (patient != null) {
      firstName = patient.firstName;
      lastName = patient.lastName;
      phoneNumber = patient.phoneNumber;
      dateOfBirth = patient.dateOfBirth;
      email = patient.email;
      gender = patient.gender;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.patientToEdit == null
                  ? "Ajouter un nouveau patient"
                  : "Modifier le patient",
              style: titleText,
            ),

            const SizedBox(height: regularSizedBox),

            MyFormField(
              label: "Nom",
              icon: Icons.badge_outlined,
              isToHide: false,
              initialValue: lastName,
              onChanged: (value) {
                lastName = value;
              },
            ),

            MyFormField(
              label: "Prénom",
              icon: Icons.person_outlined,
              isToHide: false,
              initialValue: firstName,
              onChanged: (value) {
                firstName = value;
              },
            ),

            MyFormField(
              label: "Numéro de téléphone",
              icon: Icons.phone_iphone_outlined,
              isToHide: false,
              initialValue: phoneNumber,
              onChanged: (value) {
                phoneNumber = value;
              },
            ),

            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: dateOfBirth ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (pickedDate != null) {
                  setState(() {
                    dateOfBirth = pickedDate;
                  });
                }
              },
              child: AbsorbPointer(
                child: MyFormField(
                  label: dateOfBirth == null
                      ? "Date de naissance"
                      : "${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}",
                  icon: Icons.calendar_month_outlined,
                  isToHide: false,
                  onChanged: (value) {},
                ),
              ),
            ),

            MyFormField(
              label: "Email de contact",
              icon: Icons.email,
              isToHide: false,
              initialValue: email,
              onChanged: (value) {
                email = value;
              },
            ),

            DropdownButtonFormField<String>(
              initialValue: gender.isEmpty ? null : gender,

              items: const [
                DropdownMenuItem(value: 'Femme', child: Text('Femme')),
                DropdownMenuItem(value: 'Homme', child: Text('Homme')),
              ],

              onChanged: (value) {
                setState(() {
                  gender = value ?? '';
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.wc_outlined, color: iconFormColor),
                hintText: "Sexe",
                hintStyle: TextStyle(fontSize: fontSizeS, color: textFormColor),
              ),
            ),

            const SizedBox(height: regularSizedBox),

            ActionButton(
              label: widget.patientToEdit == null
                  ? "Enregistrer un nouveau patient"
                  : "Enregistrer les modifications",
              onTap: () async {
                final db = FirestoreODM(
                  appSchema,
                  firestore: FirebaseFirestore.instance,
                );
                final patient = Patient(
                  id: widget.patientToEdit?.id ?? FirestoreODM.autoGeneratedId,
                  firstName: firstName,
                  lastName: lastName,
                  dateOfBirth: dateOfBirth!,
                  gender: gender,
                  email: email,
                  phoneNumber: phoneNumber,
                  createdAt: widget.patientToEdit?.createdAt ?? DateTime.now(),
                );

                final patients = db
                    .users(FirebaseAuth.instance.currentUser!.uid)
                    .patients;

                if (widget.patientToEdit == null) {
                  await patients.insert(patient);
                } else {
                  await patients.update(patient);
                }

                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      widget.patientToEdit == null
                          ? 'Patient ajouté'
                          : 'Patient modifié',
                    ),
                  ),
                );

                if (widget.patientToEdit == null) {
                  Navigator.pushNamed(context, MainScreen.routeName);
                } else {
                  Navigator.pop(context, patient);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
