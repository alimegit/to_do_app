import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/screens/logins/on_boarding.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';

import 'hello_screen.dart';
void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false,scaffoldBackgroundColor: AppColors.c_1A1A2F),
          home: child,
        );
      },
      child: OnBoardingScreen(),
    );
  }
}