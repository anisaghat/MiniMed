import 'package:dto/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/screens/add_new_patient.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/constants/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/schema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_odm/firestore_odm.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String routeName = '/mainscreen';

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(appSchema,firestore: FirebaseFirestore.instance,);
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return MainBackground(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: veryBigSizedBox),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Mes patients",
                  style: titleText,
                ),

                const SizedBox(width: regularSizedBox),

                IconButton(onPressed: () {Navigator.pushNamed(
                    context, AddNewPatient.routeName
                );}, icon: const Icon(Icons.person_add_alt_outlined))
              ],
            ),

            const SizedBox(height: regularSizedBox),

            Expanded(
              child: Padding (
                padding : const EdgeInsets.symmetric(horizontal : 20),
                child : StreamBuilder<List<Patient>>(
                    stream: db.users(userId).patients.stream,
                    builder: (context,snapshot) {
                      if(snapshot.hasError) {
                        return Center(child: Text("ERROR"),);
                      }
                      if(!snapshot.hasData) {
                        return Center(child: Text("NO DATA"),);
                      }

                      final patients = snapshot.data!;

                      return ListView.separated(
                          itemCount : patients.length,
                          separatorBuilder : (context, index) => const Divider(
                            thickness: 1,
                            color: Colors.black26,
                          ),
                          itemBuilder: (context,index) {
                           final patient = patients[index];

                           return Padding(
                             padding: const EdgeInsets.symmetric(vertical: 15),
                             child: Row(
                               children: [
                                 SizedBox(
                                    width : kindaBigSizedBox,
                                    child: Text(
                                      "${index + 1}",
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                 ),
                                 Text(
                                   "${patient.lastName} ${patient.firstName}",
                                   style: const TextStyle(fontSize: fontSizeM),
                                 ),
                               ],
                             ),
                           );
                      }
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}