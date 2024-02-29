import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/screens/logins/splash_screen.dart';
import 'package:to_do_app/screens/routes.dart';
import 'package:to_do_app/screens/tab_box.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';

void main(List<String> args) {
  runApp(const MyApp());
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
          initialRoute: RouteNames.helloScreen,
          onGenerateRoute: AppRoute.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false,scaffoldBackgroundColor: AppColors.c_1A1A2F),
          home: TabBox(),
        );
      },
      child: SplashScreen(),
    );
  }
}