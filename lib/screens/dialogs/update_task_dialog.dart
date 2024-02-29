import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/data/local/local_database.dart';
import 'package:to_do_app/data/models/task_model.dart';
import 'package:to_do_app/screens/dialogs/category_dialog.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/size/size_utils.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

addTaskDialog({
  required BuildContext context,
  required ValueChanged<TaskModel> taskModelChanged,

})
{
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
int activeIndex = 0;
  TaskModel taskModel = TaskModel.initialValue;

  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  String category = "work";
  int priority = 1;

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Center(
            child: Container(
              width: double.infinity,
              height: 266.h,
              decoration: BoxDecoration(
                  color: AppColors.c_242443,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 30.h, right: 12.w, left: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reja qo'shing!",
                      style: AppTextStyle.robotoMedium.copyWith(
                          color: AppColors.white,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Material(
                      color: AppColors.transparent,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (v) {
                          taskModel =
                              taskModel.copyWith(title: v);
                        },
                        controller: titleController,
                        decoration: const InputDecoration(
                            hintText: "Title",
                            hintStyle:
                            TextStyle(color: Colors.grey)),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeIndex = 1;
                            });
                            showCategorySelectDialog(
                              context: context,
                              categorySelection: (selectedCategory) {
                                setState(() {
                                  category = selectedCategory;
                                });
                                taskModel =
                                    taskModel.copyWith(category: selectedCategory);
                              },
                              category: category,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: activeIndex == 1
                                  ? AppColors.c_7A12FF
                                  : AppColors.c_1A1A2F,
                              borderRadius:
                              BorderRadius.circular(20.r),
                              border: Border.all(
                                  color: AppColors.c_7A12FF,
                                  width: 1.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 12.h),
                              child: Center(
                                child: Text(
                                  "Category",
                                  style: AppTextStyle.robotoThin
                                      .copyWith(
                                      color:
                                      AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() async {
                              activeIndex = 2;
                              var dateTime =
                              await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2035));
                              if (dateTime != null) {
                                taskModel = taskModel.copyWith(
                                    deadline: dateTime);
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: activeIndex == 2
                                  ? AppColors.c_7A12FF
                                  : AppColors.c_1A1A2F,
                              borderRadius:
                              BorderRadius.circular(20.r),
                              border: Border.all(
                                  color: AppColors.c_7A12FF,
                                  width: 1.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 15.h),
                              child: Center(
                                child: Text(
                                  "Kun",
                                  style: AppTextStyle.robotoThin
                                      .copyWith(
                                      color:
                                      AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeIndex = 4;
                              showTimePicker(
                                  context: context,
                                  initialTime: const TimeOfDay(
                                      hour: 8, minute: 00));
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: activeIndex == 4
                                  ? AppColors.c_7A12FF
                                  : AppColors.c_1A1A2F,
                              borderRadius:
                              BorderRadius.circular(20.r),
                              border: Border.all(
                                  color: AppColors.c_7A12FF,
                                  width: 1.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w,
                                  vertical: 12.h),
                              child: Center(
                                child: Text(
                                  "Vaqt",
                                  style: AppTextStyle.robotoThin
                                      .copyWith(
                                      color:
                                      AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: (taskModel.deadline
                          .toString()
                          .isNotEmpty &&
                          taskModel.title.isNotEmpty)
                          ? () async {
                        await LocalDatabase.insertTask(
                            taskModel);
                        setState(() {
                          activeIndex = 3;
                          Navigator.pop(context);
                        });
                      }
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: activeIndex == 3
                              ? AppColors.c_7A12FF
                              : AppColors.c_1A1A2F,
                          borderRadius:
                          BorderRadius.circular(20.r),
                          border: Border.all(
                              color: AppColors.c_7A12FF,
                              width: 1.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 12.h),
                          child: Center(
                            child: Text(
                              "Set",
                              style: AppTextStyle.robotoThin
                                  .copyWith(
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    },
  );
}