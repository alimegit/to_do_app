import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

showCategorySelectDialog({
  required BuildContext context,
  required ValueChanged<String> categorySelection,
  required String category,
}) {
  String selectedCategory = category;
  List<String> categories = [
    "work",
    "study",
    "sport",
    "design",
    "music",
    "home",
    "movie"
  ];
  showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: Expanded(
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 266.h,
                  decoration: BoxDecoration(
                      color: AppColors.c_1A1A2F,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 12.w, top: 30.h, right: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Categoriya tanlang!",
                              style: AppTextStyle.robotoMedium.copyWith(
                                  color: AppColors.white, fontSize: 14.sp),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "Qo'shing",
                                    style: AppTextStyle.robotoThin.copyWith(
                                        color: AppColors.white,
                                        fontSize: 11.sp),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Icon(Icons.add_box),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 10.h,
                        children: [
                          ...List.generate(categories.length, (index) {
                            return Container();
                          })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      });
}
