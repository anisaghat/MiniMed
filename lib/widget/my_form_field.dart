import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';


class MyFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isToHide;

  const MyFormField ({super.key,
  required this.label,
  required this.icon,
  required this.isToHide});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isToHide,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color : iconFormColor,
        ),
        hintText: label,
        hintStyle: TextStyle(
          fontSize: fontSizeS,
          color : textFormColor,
        )
      )
    );
  }
}
