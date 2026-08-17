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
  late bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = widget.isToHide;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      obscureText: isHidden,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: iconFormColor),
        suffixIcon: widget.isToHide
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: Icon(
                  isHidden
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: iconFormColor,
                ),
              )
            : null,
        hintText: widget.label,
        hintStyle: TextStyle(fontSize: fontSizeS, color: textFormColor),
      ),
    );
  }
}
