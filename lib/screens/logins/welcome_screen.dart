import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/screens/logins/register/button.dart';
import 'package:to_do_app/screens/logins/register/register_screen.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/images/app_images.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            SizedBox(
              height: 100,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90.r),
                    child: Image.asset(
                      AppImages.logo,
                      width: 180,
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120.h,
            ),
            LogButton(
              text: "Profil ochish",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 35.h,
            ),
            LogButton(
              text: "Profil orqali kirish",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
