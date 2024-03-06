import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/data/local/storage_repository.dart';
import 'package:to_do_app/screens/logins/splash_screen.dart';
import 'package:to_do_app/screens/routes.dart';
import 'package:to_do_app/screens/tab_box.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/theme/app_theme.dart';

void main(List<String> args) async {
WidgetsFlutterBinding.ensureInitialized();
 await StorageRepository.init();

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
        return AdaptiveTheme(
          light: AppTheme.lightTheme,
          dark: AppTheme.darkTheme,
          initial: AdaptiveThemeMode.system,
          builder: (theme,darkTheme) {
        return  MaterialApp(
        initialRoute: RouteNames.helloScreen,
        onGenerateRoute: AppRoute.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: TabBox(),
        );
        }

        );
      },
      child: SplashScreen(),
    );
  }
}
/*
scaffoldBackgroundColor: AppColors.c_1A1A2F
 */