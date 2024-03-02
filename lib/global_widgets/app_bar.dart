import 'package:flutter/material.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
class GLoAppBar extends StatefulWidget {
  const GLoAppBar({super.key});

  @override
  State<GLoAppBar> createState() => _GLoAppBarState();
}

class _GLoAppBarState extends State<GLoAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.c_2A3256,
      ),
    );
  }
}
