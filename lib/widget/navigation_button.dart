import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';

class NavigationButton extends StatelessWidget {
  final String label;
  final String page;
  final Object? arguments;

  const NavigationButton({
    super.key,
    required this.label,
    required this.page,
    this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, page, arguments: arguments);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: navigateButtonColor,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: fontSizeM, color: Colors.white),
        ),
      ),
    );
  }
}
