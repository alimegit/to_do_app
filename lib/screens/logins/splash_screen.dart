import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/screens/routes.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';

import '../../utils/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 500),
          () {
        Navigator.pushReplacementNamed(context, RouteNames.welcomeScreen);
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.c_1A1A2F,
          statusBarIconBrightness: Brightness.light),

      child: Scaffold(
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: Image.asset(AppImages.logo,width: 150,height: 150,),
          ),
        ),
      ),
    );
  }
}
