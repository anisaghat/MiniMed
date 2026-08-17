import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/models/patient.dart';
import 'package:dto/schema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/constants/sizes.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/screens/add_new_patient.dart';
import 'package:minimed/screens/patient-treatment.dart';
import 'package:minimed/widget/action_button.dart';
import 'package:minimed/widget/main_background.dart';

class PatientDetailsScreen extends StatefulWidget {
  final Patient patient;

  const PatientDetailsScreen({super.key, required this.patient});

  static const String routeName = '/patient-details';

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  late Patient patient;

  @override
  void initState() {
    super.initState();
    patient = widget.patient;
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return MainBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: screenHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: veryBigSizedBox),

            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Text(
                    '${patient.firstName} ${patient.lastName}',
                    style: titleText,
                  ),
                ),
              ],
            ),

            const SizedBox(height: regularSizedBox),

            _InfoRow(
              icon: Icons.calendar_month_outlined,
              label: 'Date de naissance',
              value:
                  '${patient.dateOfBirth.day}/${patient.dateOfBirth.month}/${patient.dateOfBirth.year}',
            ),
            _InfoRow(
              icon: Icons.phone_iphone_outlined,
              label: 'Téléphone',
              value: patient.phoneNumber,
            ),
            _InfoRow(
              icon: Icons.email_outlined,
              label: 'Email',
              value: patient.email,
            ),
            _InfoRow(
              icon: Icons.wc_outlined,
              label: 'Sexe',
              value: patient.gender,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ActionButton(
                label: 'Voir le traitement',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PatientTreatmentScreen(patient: patient),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: smallSizedBox),

            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    label: 'Modifier le patient',
                    onTap: () => _editPatient(context),
                  ),
                ),

                const SizedBox(width: smallSizedBox),

                Expanded(
                  child: ActionButton(
                    label: 'Supprimer le patient',
                    onTap: () => _confirmDelete(context, userId),
                  ),
                ),
              ],
            ),

            const SizedBox(height: regularSizedBox),
          ],
        ),
      ),
    );
  }

  Future<void> _editPatient(BuildContext context) async {
    final updatedPatient = await Navigator.push<Patient>(
      context,
      MaterialPageRoute(builder: (_) => AddNewPatient(patientToEdit: patient)),
    );

    if (updatedPatient == null || !mounted) return;

    setState(() {
      patient = updatedPatient;
    });
  }

  void _confirmDelete(BuildContext context, String userId) {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Supprimer ce patient ?'),
        content: Text(
          'Cette action est irréversible pour '
          '${patient.firstName} ${patient.lastName}.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              await db.users(userId).patients(patient.id).delete();

              if (!dialogContext.mounted || !context.mounted) return;

              Navigator.pop(dialogContext);
              Navigator.pop(context);
            },
            child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: smallSizedBox),
      child: Row(
        children: [
          Icon(icon, color: iconFormColor),

          const SizedBox(width: regularSizedBox),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: fontSizeS, color: textFormColor),
                ),
                Text(value, style: const TextStyle(fontSize: fontSizeM)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
