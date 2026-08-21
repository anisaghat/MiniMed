import 'package:dto/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/screens/main_screen/profile_screen.dart';
import 'package:minimed/screens/main_screen/settings_screen.dart';
import 'package:minimed/screens/patients/add_new_patient.dart';
import 'package:minimed/screens/patients/patient_details_screen.dart';
import 'package:minimed/widget/main_background.dart';
import 'package:minimed/constants/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/schema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_odm/firestore_odm.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = '/mainscreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MainBackground(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
        indicatorColor: actionButtonColor,
        onDestinationSelected: (index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
      child: IndexedStack(
        index: selectedPageIndex,
        children: [
          _buildHomePage(context),
          const ProfileScreen(),
          const SettingsScreen(),
        ],
      ),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: veryBigSizedBox),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mes patients",
                style: titleText.copyWith(fontWeight: FontWeight.w500),
              ),

              const SizedBox(width: regularSizedBox),

              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddNewPatient.routeName);
                },
                icon: Icon(Icons.person_add_alt_outlined, color: iconFormColor),
              ),
            ],
          ),

          const SizedBox(height: regularSizedBox),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: screenHorizontalPadding,
              ),
              child: StreamBuilder<List<Patient>>(
                stream: db.users(userId).patients.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        "Impossible de charger les patients",
                        style: TextStyle(fontSize: fontSizeM),
                      ),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(color: blue),
                    );
                  }

                  final patients = snapshot.data!;

                  if (patients.isEmpty) {
                    return Center(
                      child: Text(
                        "Aucun patient",
                        style: TextStyle(
                          fontSize: fontSizeM,
                          color: textFormColor,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: patients.length,
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      color: Colors.black26,
                      indent: kindaBigSizedBox,
                      endIndent: smallSizedBox,
                    ),
                    itemBuilder: (context, index) {
                      final patient = patients[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PatientDetailsScreen(patient: patient),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: smallSizedBox,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person_outline, color: iconFormColor),

                              const SizedBox(width: smallSizedBox),

                              Expanded(
                                child: Text(
                                  "${patient.lastName} ${patient.firstName}",
                                  style: const TextStyle(
                                    fontSize: fontSizeM,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              Icon(Icons.chevron_right, color: iconFormColor),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
