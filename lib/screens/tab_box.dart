import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/screens/home_screen/menu_screen.dart';
import 'package:to_do_app/screens/tasks_screen/task_screen.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/images/app_images.dart';

import 'caledar_screen/calendar_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      const TasksScreen(),
      const CalendarScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        selectedItemColor: Colors.white,
        unselectedFontSize: 14,
        backgroundColor: AppColors.c_242443,
        items: [
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(AppImages.menu),
          //   activeIcon: SvgPicture.asset(AppImages.menu,color: AppColors.white,),
          //   label: "Menu",
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.tasks),
            activeIcon: SvgPicture.asset(AppImages.tasks, color: AppColors.white,),
            label: "Rejalar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.calendar),
            activeIcon: SvgPicture.asset(AppImages.calendar,color: AppColors.white,),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.profileIcon),
            activeIcon: SvgPicture.asset(AppImages.profileIcon,color: AppColors.white,),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}