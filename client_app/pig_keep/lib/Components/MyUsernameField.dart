import 'package:flutter/material.dart';

class RecyclableTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final int maxLines;
  final int minLines;
  final IconData? icon;
  final String? imagePath;
  final double? textSize;
  final double? height;
  final double? iconSize;

  const RecyclableTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.icon,
    this.imagePath,
    this.textSize,
    this.height,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: icon != null
              ? Icon(icon, size: iconSize)
              : imagePath != null
                  ? SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: Image.asset(
                        imagePath!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : null,
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        style: TextStyle(
          fontSize: textSize,
        ),
      ),
    );
  }
}
