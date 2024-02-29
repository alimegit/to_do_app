import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/data/local/storage_repository.dart';
import 'package:to_do_app/data/models/task_model.dart';
import 'package:to_do_app/screens/logins/register/register_screen.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';
import '../../utils/images/app_images.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TaskModel taskModel = TaskModel.initialValue;
  late ValueChanged title;
  StorageRepository name = StorageRepository();
  RegisterScreen nameController = RegisterScreen();
  int activeIndex = 0;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    taskModel.canAddTaskToDatabase();
    super.initState();
  }

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
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.c_2A3256,
                border: Border.all(color: AppColors.c_7A12FF),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 27.h, left: 10.w, right: 16.w, bottom: 27.h),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        MenuBar(children: [
                          Image.asset(AppImages.logo),
                        ]);
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 30.sp,
                      ),
                      color: AppColors.c_1A1A2F,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        AppImages.profile,
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Salom , Ali",
                            style: AppTextStyle.robotoRegular.copyWith(
                                color: AppColors.white, fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Rejalar bilan tanishing!",
                            style: AppTextStyle.robotoMedium.copyWith(
                                color: AppColors.white, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.h, right: 15.w, left: 15.w),
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(builder: (context, setState) {
                        return Center(
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
                                      controller: TextEditingController(),
                                      decoration:
                                          InputDecoration(hintText: ">>>"),
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
                                                        color: AppColors.white),
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
                                           var dateTime = await  showDatePicker(
                                                context: context,
                                                firstDate: DateTime(2024),
                                                lastDate: DateTime(2035));
                                            if(dateTime != null) {
                                          taskModel = taskModel.copyWith(deadline: dateTime);
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
                                                horizontal: 8.w,
                                                vertical: 12.h),
                                            child: Center(
                                              child: Text(
                                                "Kun",
                                                style: AppTextStyle.robotoThin
                                                    .copyWith(
                                                        color: AppColors.white),
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
                                            showTimePicker(context: context, initialTime: TimeOfDay(hour: 8, minute: 00));
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
                                                    color: AppColors.white),
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
                                    onTap: () {
                                      setState(() {
                                        activeIndex = 3;
                                        Navigator.pop(context);
                                      });
                                    },
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
                                            horizontal: 30.w,
                                            vertical: 12.h),
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
                        );
                      });
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.c_7A12FF,
                      borderRadius: BorderRadius.circular(20.sp)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.newTask),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Yangi reja qo'shish",
                            style: AppTextStyle.robotoMedium.copyWith(
                                color: AppColors.white, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
