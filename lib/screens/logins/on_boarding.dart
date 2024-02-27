import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/screens/logins/welcome_screen.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';

import '../../utils/images/app_images.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 500),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WelcomeScreen();
            },
          ),
        );
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
