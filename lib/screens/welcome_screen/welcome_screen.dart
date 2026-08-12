import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/widget/navigation_button.dart';
import 'package:minimed/screens/auth_screen/auth_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: welcomeScreenBackground,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            Container(
              width: 160,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Text(
                "MiniMed",
                style: TextStyle(
                  fontSize: fontSizeXL,
                  color: Colors.black,
                ),
              ),
            ),

            const Spacer(),

            NavigationButton(
              label: "Commencer",
              page: AuthScreen.routeName,
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}