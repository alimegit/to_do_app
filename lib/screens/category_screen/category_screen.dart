import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/data/local/local_database.dart';
import 'package:to_do_app/data/models/category/category_model.dart';
import 'package:to_do_app/screens/category_screen/local_category.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/images/app_images.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, this.onSet});
  final Function? onSet;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController categoryNameController = TextEditingController();
  CategoryModel categoryModel = CategoryModel.initialValue;
  Color color = Color(0xFF1D1D1D);
  String icon = "";
  List<CategoryModel> categories = [];
  _init() async {
    categories = await LocalDatabase.getAllCategory();
    debugPrint("CATEGORIES LENGTH ${categories.length}");

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_242443,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 24.sp,
          ),
        ),
        title: Text(
          "Categoriya qo'shish",
          style: AppTextStyle.robotoThinItalic
              .copyWith(color: Colors.white, fontSize: 18.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0, left: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(top: 35.h, left: 15, right: 15),
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: categoryNameController,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: "Categoriya nomi",
                  labelStyle: TextStyle(color: Colors.white10, fontSize: 14.sp),
                ),
              ),
            ),
            SizedBox(
              height: 33,
            ),
            Text(
              "Category color :",
              style: AppTextStyle.robotoThinItalic
                  .copyWith(fontSize: 16.sp, color: Colors.white),
            ),
            // Row(
            //   children: [
            //    ...List.generate(categoryModel.iconPath.length, (index) => Container(
            //      decoration: BoxDecoration(
            //        color: colors[index],
            //        borderRadius: BorderRadius.circular(16.r),
            //      ),
            //      child: Stack(
            //        children: [
            //          Text(categoryModel.name),
            //        ],
            //      )
            //    ),)
            //   ],
            // ),
            SizedBox(
              height: 60,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    colors.length,
                    (index) {
                      return ZoomTapAnimation(
                        onTap: () {
                          color = colors[index];
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          width: 60.w,
                          height: 60.w,
                          decoration: BoxDecoration(
                            color: colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Category icon :",
              style: AppTextStyle.robotoThinItalic
                  .copyWith(fontSize: 16.sp, color: Colors.white),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  final iconItem = icons[index];
                  return ZoomTapAnimation(
                    onTap: () {
                      icon = AppImages.menu;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: iconItem,
                    ),
                  );
                },
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.fromLTRB(0.w,0.h,13.w,10.h),
              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(8.r),

                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 80.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColors.c_7A12FF,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: AppTextStyle.robotoMedium
                              .copyWith(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    borderRadius: BorderRadius.circular(8.r),
                    onTap: () async {
                      categoryModel = categoryModel.copyWith(color: color,iconPath: icon,name: categoryNameController.text);
                      print(categoryModel.name);
                      print(categoryModel.iconPath);
                      print(categoryModel.color.value);
                      if (categoryModel.canAddTaskToDatabase()) {
                        await LocalDatabase.insertCategory(categoryModel);
                        await _init();
                        if(widget.onSet != null){
                          widget.onSet!.call();
                        }
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: 80.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColors.c_7A12FF,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          "OK",
                          style: AppTextStyle.robotoMedium
                              .copyWith(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
