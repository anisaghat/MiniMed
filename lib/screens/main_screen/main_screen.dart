import 'package:flutter/material.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/screens/add_new_patient.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/constants/sizes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String routeName = '/mainscreen';

  @override
  Widget build(BuildContext context) {
    final List<List<String>> patients = [
      ["Dupont", "Jean"],
      ["Martin", "Marie"],
      ["Durand", "Pierre"],
      ["Robert", "Lucie"],
      ["Lambert", "Paul"],
      ["Dupont", "Jean"],
      ["Martin", "Marie"],
      ["Durand", "Pierre"],
      ["Robert", "Lucie"],
      ["Lambert", "Paul"],
      ["Dupont", "Jean"],
      ["Martin", "Marie"],
      ["Durand", "Pierre"],
      ["Robert", "Lucie"],
      ["Lambert", "Paul"],
      ["Dupont", "Jean"],
      ["Martin", "Marie"],
      ["Durand", "Pierre"],
      ["Robert", "Lucie"],
      ["Lambert", "Paul"],
      ["Dupont", "Jean"],
      ["Martin", "Marie"],
      ["Durand", "Pierre"],
      ["Robert", "Lucie"],
      ["Lambert", "Paul"],
    ];

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
                child : ListView.separated(
                  itemCount: patients.length,
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),
                  itemBuilder: (context, index) {
                    final patient = patients[index];
                    final prenom = patient[0];
                    final nom = patient[1];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "$nom $prenom",
                            style: const TextStyle(fontSize: fontSizeM),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}