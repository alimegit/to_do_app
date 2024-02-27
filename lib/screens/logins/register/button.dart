import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
class LogButton extends StatefulWidget {
  const LogButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;


  @override
  State<LogButton> createState() => _LogButtonState();
}

class _LogButtonState extends State<LogButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:15.w,right:15.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: widget.onTap,
        child: Container(
          width:double.infinity,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.white.withOpacity(.02),
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(.09),
                spreadRadius: 2.r,
                blurRadius: 1.r,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding:  EdgeInsets.only(top: 10.h,bottom: 10.h),
              child: Text(widget.text,style: TextStyle(color: AppColors.white),),
            ),
          ),
        ),
      ),
    );
  }
}
