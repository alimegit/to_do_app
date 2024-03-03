import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/data/local/local_database.dart';
import 'package:to_do_app/data/local/storage_repository.dart';
import 'package:to_do_app/data/models/category/category_model.dart';
import 'package:to_do_app/data/models/task_model.dart';
import 'package:to_do_app/screens/category_screen/category_screen.dart';
import 'package:to_do_app/screens/logins/register/register_screen.dart';
import 'package:to_do_app/screens/routes.dart';
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
  List<TaskModel> tasks = [];
  List<CategoryModel> categories = [];
  List<TaskModel> description = [];

  _init() async {
    tasks = await LocalDatabase.getAllTasks();
    categories = await LocalDatabase.getAllCategory();
    if(!context.mounted) return ;
    print("categories length : ${categories.length}");
    setState(() {});
  }

  StorageRepository name = StorageRepository();
  RegisterScreen nameController = RegisterScreen();
  final TextEditingController titleController =
      TextEditingController(text: TaskModel.initialValue.title);
  final TextEditingController descriptionController =
      TextEditingController(text: TaskModel.initialValue.description);
  int activeIndex = 0;
  final TextEditingController controller = TextEditingController();
  final UndoHistoryController removeController = UndoHistoryController();
  CategoryModel categoryModel = CategoryModel.initialValue;
  String category = "work";

  @override
  void initState() {
    _init();
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
              child: RefreshIndicator(
                color: AppColors.c_7A12FF,
                backgroundColor: AppColors.c_1A1A2F,
                onRefresh: () {
                  _init();
                  return Future<void>.delayed(const Duration(seconds: 2));
                },
                child: ListView(
                  children: [
                    Column(
                      children: [
                        ...List.generate(
                          tasks.length,
                          (index) {
                            TaskModel taskModel = tasks[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.h, vertical: 10.h),
                              child: Container(
                                height: 45.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        taskModel.description,
                                        style: AppTextStyle.robotoRegular
                                            .copyWith(
                                                color: AppColors.white,
                                                fontSize: 14.sp),
                                      ),
                                      Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context,
                                                RouteNames.titleInfoScreen);
                                          },
                                          icon: Icon(
                                            Icons.arrow_right,
                                            color: Colors.white,
                                            size: 24.sp,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
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
                                        onChanged: (v) {
                                          taskModel = taskModel.copyWith(
                                              description: v);
                                        },
                                        controller: descriptionController,
                                        decoration: const InputDecoration(
                                            hintText: "Mavzu",
                                            hintStyle:
                                                TextStyle(color: Colors.grey)),
                                      ),
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
                                      height: 30.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.w),
                                                    child: Center(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 336,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.r),
                                                            color: AppColors
                                                                .c_1A1A2F),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      15.w),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 15.h,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Categoriya tanlang",
                                                                    style: AppTextStyle
                                                                        .robotoMedium
                                                                        .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.sp,
                                                                    ),
                                                                  ),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) => CategoryScreen(iconnn:
                                                                                (v) {
                                                                              categoryModel = categoryModel.copyWith(iconPath: v);
                                                                            }, texttt:
                                                                                (v) {
                                                                              categoryModel = categoryModel.copyWith(name: v);
                                                                            }, colorrr:
                                                                                (v) {
                                                                              categoryModel = categoryModel.copyWith(color: v);
                                                                            }),
                                                                          ),
                                                                        );
                                                                        LocalDatabase.insertCategory(
                                                                            categoryModel);
                                                                        setState(
                                                                            () {
                                                                          _init();
                                                                        });
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons.add_box,
                                                                            color:
                                                                                CupertinoColors.activeGreen,
                                                                          ),
                                                                          Text(
                                                                            "Qo'shing",
                                                                            style:
                                                                                AppTextStyle.robotoMedium.copyWith(
                                                                              color: Colors.white,
                                                                              fontSize: 11.sp,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),),
                                                                ],
                                                              ),
                                                         Column(
                                                            children: List.generate(categories.length + 1, (index) {
                                                              if (index == categories.length) {
                                                                return TextButton(
                                                                  onPressed: () {},
                                                                  child: Column(
                                                                    children: [
                                                                      Icon(Icons.add),
                                                                      Text("Add New"),
                                                                    ],
                                                                  ),
                                                                );
                                                              } else {
                                                                return Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        color: categories[index].color,
                                                                      ),
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Column(
                                                                          children: [
                                                                            SvgPicture.asset(categories[index].iconPath),
                                                                            Text(
                                                                              categories[index].name,
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 20.sp,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              }
                                                            }),
                                                          )

                                                          ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
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
                                                  horizontal: 25.w,
                                                  vertical: 12.h),
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
                                                titleController.clear();
                                                descriptionController.clear();
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
