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
import 'package:minimed/services/notifications_service.dart';
import 'package:minimed/widget/action_button.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/widget/my_form_field.dart';

class AddNewMedication extends StatefulWidget {
  final Patient patient;

  const AddNewMedication({super.key, required this.patient});

  static const String routeName = '/addnewmedication';

  @override
  State<AddNewMedication> createState() => _AddNewMedicationState();
}

class _AddNewMedicationState extends State<AddNewMedication> {
  String name = '';
  String dosageValueInput = '';
  String dosageUnit = '';
  int timesPerDay = 1;
  String instructions = '';
  TimeOfDay? reminderTime;

  @override
  Widget build(BuildContext context) {
    return MainBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ajouter un médicament', style: titleText),

            const SizedBox(height: regularSizedBox),

            MyFormField(
              label: 'Nom du médicament',
              icon: Icons.medication_outlined,
              isToHide: false,
              onChanged: (value) {
                name = value;
              },
            ),

            MyFormField(
              label: 'Valeur du dosage',
              icon: Icons.science_outlined,
              isToHide: false,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onChanged: (value) {
                dosageValueInput = value;
              },
            ),

            DropdownButtonFormField<String>(
              initialValue: dosageUnit.isEmpty ? null : dosageUnit,
              items: const [
                DropdownMenuItem(value: 'mg', child: Text('mg')),
                DropdownMenuItem(value: 'g', child: Text('g')),
                DropdownMenuItem(value: 'mL', child: Text('mL')),
              ],
              onChanged: (value) {
                setState(() {
                  dosageUnit = value ?? '';
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.straighten_outlined,
                  color: iconFormColor,
                ),
                hintText: 'Unité du dosage',
                hintStyle: TextStyle(fontSize: fontSizeS, color: textFormColor),
              ),
            ),

            Row(
              children: [
                Icon(Icons.schedule_outlined, color: iconFormColor),

                const SizedBox(width: smallSizedBox),

                const Expanded(
                  child: Text(
                    'Prises par jour',
                    style: TextStyle(fontSize: fontSizeM),
                  ),
                ),

                IconButton(
                  onPressed: timesPerDay > 1
                      ? () {
                          setState(() {
                            timesPerDay--;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),

                Text(
                  '$timesPerDay',
                  style: const TextStyle(
                    fontSize: fontSizeM,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      timesPerDay++;
                    });
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),

            GestureDetector(
              onTap: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(hour: 8, minute: 0),
                );

                if (pickedTime != null && mounted) {
                  setState(() {
                    reminderTime = pickedTime;
                  });
                }
              },
              child: AbsorbPointer(
                child: MyFormField(
                  label: reminderTime == null
                      ? 'Heure de rappel (optionnel)'
                      : 'Rappel à ${reminderTime!.hour.toString().padLeft(2, '0')}:${reminderTime!.minute.toString().padLeft(2, '0')}',
                  icon: Icons.notifications_active_outlined,
                  isToHide: false,
                  onChanged: (_) {},
                ),
              ),
            ),

            MyFormField(
              label: 'Instructions (optionnel)',
              icon: Icons.notes_outlined,
              isToHide: false,
              onChanged: (value) {
                instructions = value;
              },
            ),

            const SizedBox(height: regularSizedBox),

            ActionButton(
              label: 'Sauvegarder',
              onTap: () async {
                final dosageValue = double.tryParse(
                  dosageValueInput.replaceAll(',', '.'),
                );

                if (name.trim().isEmpty ||
                    dosageValue == null ||
                    dosageValue <= 0 ||
                    dosageUnit.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Veuillez compléter les champs obligatoires',
                      ),
                    ),
                  );
                  return;
                }

                final db = FirestoreODM(
                  appSchema,
                  firestore: FirebaseFirestore.instance,
                );

                await db
                    .users(FirebaseAuth.instance.currentUser!.uid)
                    .patients(widget.patient.id)
                    .medications
                    .insert(
                      Medication(
                        id: FirestoreODM.autoGeneratedId,
                        name: name.trim(),
                        dosageValue: dosageValue,
                        dosageUnit: dosageUnit,
                        timesPerDay: timesPerDay,
                        instructions: instructions.trim().isEmpty
                            ? null
                            : instructions.trim(),
                        createdAt: DateTime.now(),
                      ),
                    );

                if (reminderTime != null) {
                  final notificationId = DateTime.now().millisecondsSinceEpoch
                      .remainder(100000);
                  await NotificationsService.scheduleReminder(
                    id: notificationId,
                    medicationName: name.trim(),
                    hour: reminderTime!.hour,
                    minute: reminderTime!.minute,
                  );
                }

                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Médicament ajouté')),
                );

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
