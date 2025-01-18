import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class IconInputForm extends StatefulWidget {
  final IconData prefixIcon;
  final String labelText;
  final IconData? suffixIcon;
  final TextEditingController controller;
  bool obscureText;
  final int? maxLength;
  final TextInputType keyboardType;

  IconInputForm({
    super.key,
    required this.prefixIcon,
    required this.labelText,
    this.suffixIcon,
    required this.controller,
    this.obscureText = false,
    this.maxLength,
    this.keyboardType = TextInputType.text,
  });

  @override
  _IconInputFormState createState() => _IconInputFormState();
}

class _IconInputFormState extends State<IconInputForm> {
  bool _isFocused = false;

  late final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _toggleObscureText() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.controller,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
        color: appTertiary,
      ),
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: Icon(
          widget.prefixIcon,
          color: _isFocused ? appPrimary : appTertiary,
        ),
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(
                  widget.obscureText
                      ? widget.suffixIcon
                      : Icons.visibility_rounded,
                  color: _isFocused ? appPrimary : appTertiary,
                ),
                onPressed: () {
                  if (widget.suffixIcon != null) {
                    _toggleObscureText();
                  }
                },
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1.w, color: appPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: appTertiary,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: _isFocused ? appPrimary : appGray,
        ),
      ),
      onFieldSubmitted: (_) {
        setState(() {
          _isFocused = false;
        });
      },
    );
  }
}
