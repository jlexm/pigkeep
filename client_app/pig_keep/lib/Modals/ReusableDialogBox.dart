import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class ReusableDialogBox extends StatelessWidget {
  final String title;
  final String description;
  final List<RecyclableTextFormField> formFields;
  final VoidCallback onSave;
  final String saveButtonText;
  final Color saveButtonColor;

  const ReusableDialogBox({
    super.key,
    required this.title,
    required this.description,
    required this.formFields,
    required this.onSave,
    this.saveButtonText = 'Save',
    this.saveButtonColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h, bottom: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.w700,
                color: appTertiary,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              description,
              style: TextStyle(
                fontSize: 12.sp,
                color: appTertiary,
              ),
            ),
            SizedBox(height: 11.h),
            Column(
              children: formFields
                  .map((field) => Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: field,
                      ))
                  .toList(),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: onSave,
                style: ElevatedButton.styleFrom(
                  foregroundColor: appSecondary,
                  backgroundColor: saveButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(saveButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
  final double? hintTextSize;
  final double? height;
  final double? iconSize;
  final EdgeInsetsGeometry? contentPadding;
  final List<CustomDropDownItem>? dropdownItems;
  final bool showDropdown;
  final bool showIcon;
  final bool readOnly;
  final void Function()? onTap;

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
    this.hintTextSize,
    this.height,
    this.iconSize,
    this.contentPadding,
    this.dropdownItems,
    this.showDropdown = false,
    this.showIcon = true,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              hintStyle: hintTextSize != null
                  ? TextStyle(fontSize: hintTextSize)
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: showIcon
                  ? icon != null
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
                          : null
                  : null,
              contentPadding: contentPadding,
            ),
            readOnly: readOnly,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            onSaved: onSaved,
            onChanged: onChanged,
            onTap: onTap,
            maxLines: maxLines,
            minLines: minLines,
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
          if (showDropdown && dropdownItems != null)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      controller.text = newValue!;
                      if (onChanged != null) {
                        onChanged!(newValue);
                      }
                    },
                    items: dropdownItems!.map<DropdownMenuItem<String>>(
                        (CustomDropDownItem item) {
                      return DropdownMenuItem<String>(
                        value: item.value, // Ensure this is a String
                        child: Text(
                          item.label,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
