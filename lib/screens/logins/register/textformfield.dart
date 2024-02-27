import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
class TextFormFields extends StatefulWidget {
  const TextFormFields({super.key, required this.controller, required this.fullText});
final TextEditingController controller;
final String fullText;

  @override
  State<TextFormFields> createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w,right:20.w),
      child: TextFormField(
        controller: widget.controller,
            validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Iltimos bo'sh maydon kiritmang!";
          } else {
            return null;
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          suffixStyle: TextStyle(color: AppColors.white),
          fillColor: AppColors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.white,
                    width: 2.w,
              ),
              borderRadius: BorderRadius.circular(20.h)
          ),
          hintText: widget.fullText,
          hintStyle: TextStyle(color: AppColors.white),
        ),
      ),

    );
  }
}
