import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/models/medication.dart';
import 'package:dto/models/patient.dart';
import 'package:dto/schema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/constants/sizes.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/screens/medication/add_new_medication.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/widget/navigation_button.dart';

class PatientTreatmentScreen extends StatelessWidget {
  final Patient patient;

  const PatientTreatmentScreen({super.key, required this.patient});

  static const String routeName = '/patient-treatment';

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Traitement', style: titleText),
                      Text(
                        '${patient.firstName} ${patient.lastName}',
                        style: const TextStyle(fontSize: fontSizeM),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: regularSizedBox),

            Expanded(
              child: StreamBuilder<List<Medication>>(
                stream: db
                    .users(userId)
                    .patients(patient.id)
                    .medications
                    .stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Impossible de charger les médicaments',
                        style: TextStyle(fontSize: fontSizeM),
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(color: blue),
                    );
                  }

                  final medications = snapshot.data!;

                  if (medications.isEmpty) {
                    return Center(
                      child: Text(
                        'Aucun médicament',
                        style: TextStyle(
                          fontSize: fontSizeM,
                          color: textFormColor,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: medications.length,
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      color: Colors.black26,
                      indent: kindaBigSizedBox,
                      endIndent: smallSizedBox,
                    ),
                    itemBuilder: (context, index) {
                      final medication = medications[index];
                      final frequency = medication.timesPerDay == 1
                          ? '1 prise par jour'
                          : '${medication.timesPerDay} prises par jour';

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: smallSizedBox,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.medication_outlined,
                              color: iconFormColor,
                            ),

                            const SizedBox(width: smallSizedBox),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    medication.name,
                                    style: const TextStyle(
                                      fontSize: fontSizeM,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${_formatDosage(medication.dosageValue)} '
                                    '${medication.dosageUnit} · $frequency',
                                    style: TextStyle(
                                      fontSize: fontSizeS,
                                      color: textFormColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: smallSizedBox),

            Center(
              child: NavigationButton(
                label: 'Ajouter un médicament',
                page: AddNewMedication.routeName,
                arguments: patient,
              ),
            ),

            const SizedBox(height: regularSizedBox),
          ],
        ),
      ),
    );
  }

  String _formatDosage(double dosage) {
    if (dosage == dosage.truncateToDouble()) {
      return dosage.toInt().toString();
    }

    return dosage.toString();
  }
}
