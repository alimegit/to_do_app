import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/hello_screen.dart';
import 'package:to_do_app/screens/home_screen/menu_screen.dart';
import 'package:to_do_app/screens/logins/splash_screen.dart';
import 'package:to_do_app/screens/logins/register/register_screen.dart';
import 'package:to_do_app/screens/logins/welcome_screen.dart';
import 'package:to_do_app/screens/title_info/title_info.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return navigate(const HelloScreen());

        }
      case "/splash_route":
        {
          return navigate( const SplashScreen());

        }
      case "/register_route":
        {
          return navigate(const RegisterScreen());

        }
      case "/home_route":
        {
          return navigate(const ProfileScreen());
        }
      case "/welcome_route":
        {
          return navigate(const WelcomeScreen());
        }
      // case "/category_route":
      //   {
      //
      //     return navigate( CategoryScreen(onSet: settings.arguments as Function?,),);
      //   }
      case "/info_route":
        {
          return navigate(const TitleInfoScreen());
        }
      default:
        {
          return navigate(
            Scaffold(
              body: Center(
                child: Text(
                  "Mavjud Emas",
                  style: TextStyle(fontSize: 30.sp),
                ),
              ),
            ),
          );
        }
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String helloScreen = "/";
  static const String splashScreen = "/splash_route";
  static const String welcomeScreen = "/welcome_route";
  static const String registerScreen = "/register_route";
  static const String titleInfoScreen = "/info_route";
}
