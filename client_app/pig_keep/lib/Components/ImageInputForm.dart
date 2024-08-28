import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class ImageInputForm extends StatefulWidget {
  final Widget? prefixIcon;
  final String labelText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool? enable;

  ImageInputForm({
    this.prefixIcon,
    required this.labelText,
    required this.controller,
    this.validator,
    this.enable, required TextStyle textStyle,
  });

  @override
  _ImageInputFormState createState() => _ImageInputFormState();
}

class _ImageInputFormState extends State<ImageInputForm> {
  bool _isFocused = false;

  late FocusNode _focusNode = FocusNode();

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enable,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
        color: appTertiary,
      ),
      focusNode: _focusNode,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null
            ? ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _isFocused ? appPrimary : appTertiary,
                  BlendMode.srcIn,
                ),
                child: widget.prefixIcon,
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
      validator: widget.validator,
      onFieldSubmitted: (_) {
        setState(() {
          _isFocused = false;
        });
      },
    );
  }
}
