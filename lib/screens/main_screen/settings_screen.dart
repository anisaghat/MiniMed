import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';
import 'package:minimed/constants/sizes.dart';
import 'package:minimed/constants/style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.settings_outlined,
            size: kindaBigSizedBox,
            color: iconFormColor,
          ),

          const SizedBox(height: regularSizedBox),

          const Text('Paramètres', style: titleText),

          const SizedBox(height: smallSizedBox),

          const Text('Langue', style: TextStyle(fontSize: fontSizeM)),

          const SizedBox(height: smallSizedBox),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('FR', style: TextStyle(fontSize: fontSizeM)),

              Switch(
                value: isEnglish,
                activeTrackColor: actionButtonColor,
                onChanged: (value) {
                  setState(() {
                    isEnglish = value;
                  });
                },
              ),

              const Text('ENG', style: TextStyle(fontSize: fontSizeM)),
            ],
          ),
        ],
      ),
    );
  }
}
