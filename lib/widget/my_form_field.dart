import 'package:flutter/material.dart';
import 'package:minimed/constants/colors.dart';
import 'package:minimed/constants/fonts.dart';

class MyFormField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isToHide;
  final Function(String) onChanged;
  final String? initialValue;
  final TextInputType? keyboardType;

  const MyFormField({
    super.key,
    required this.label,
    required this.icon,
    required this.isToHide,
    required this.onChanged,
    this.initialValue,
    this.keyboardType,
  });

  @override
  State<MyFormField> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      obscureText: widget.isToHide,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: iconFormColor),
        hintText: widget.label,
        hintStyle: TextStyle(fontSize: fontSizeS, color: textFormColor),
      ),
    );
  }
}
