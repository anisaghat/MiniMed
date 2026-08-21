import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/constants/sizes.dart';
import 'package:minimed/constants/style.dart';
import 'package:minimed/screens/auth_screen/auth_screen.dart';
import 'package:minimed/widget/action_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser?.email;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: kindaBigSizedBox,
            color: iconFormColor,
          ),

          const SizedBox(height: regularSizedBox),

          const Text('Profil', style: titleText),

          const SizedBox(height: smallSizedBox),

          Text(
            email ?? 'Aucune adresse email',
            style: const TextStyle(fontSize: fontSizeM),
          ),

          const SizedBox(height: regularSizedBox),

          ActionButton(
            label: 'Se déconnecter',
            onTap: () async {
              await FirebaseAuth.instance.signOut();

              if (!context.mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                context,
                AuthScreen.routeName,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
