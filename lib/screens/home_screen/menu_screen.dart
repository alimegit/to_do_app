import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/data/local/storage_repository.dart';
import 'package:to_do_app/screens/logins/register/register_screen.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

import '../../utils/images/app_images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  StorageRepository name = StorageRepository();
  RegisterScreen nameController = RegisterScreen();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.c_2A3256,
                border: Border.all(color: AppColors.c_7A12FF),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 27.h, left: 10.w, right: 16.w, bottom: 27.h),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        MenuBar(children: [
                          Image.asset(AppImages.logo),
                        ]);
                      },
                      icon: Icon(Icons.menu,size: 30.sp,),
                      color: AppColors.c_1A1A2F,
                    ),
                    SizedBox(width: 10.w,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                        child: Image.asset(AppImages.profile,width: 40.w,height: 40.h,fit: BoxFit.cover,
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Salom , Ali",
                            style: AppTextStyle.robotoRegular.copyWith(
                                color: AppColors.white, fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Rejalar bilan tanishing!",
                            style: AppTextStyle.robotoMedium.copyWith(
                                color: AppColors.white, fontSize: 16.sp),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
