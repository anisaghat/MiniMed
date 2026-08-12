import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';


class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ActionButton({super.key,
  required this.label,
  required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
      child:
        Container(
          width: 220,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: actionButtonColor,
          ),
            child:
            Center(
              child: Text(label,
              style: TextStyle(
                fontSize: fontSizeM,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            )
          ),
        )
    );
  }
}
