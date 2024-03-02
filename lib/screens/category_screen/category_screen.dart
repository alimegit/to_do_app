import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/data/local/local_database.dart';
import 'package:to_do_app/data/models/category/category_model.dart';
import 'package:to_do_app/screens/category_screen/local_category.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key,required this.iconnn, required this.texttt, required this.colorrr, });
  final ValueChanged<String> iconnn;
  final ValueChanged<String> texttt;
  final ValueChanged<Color> colorrr;


  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController categoryNameController = TextEditingController();
  CategoryModel categoryModel = CategoryModel.initialValue;
  Color color = Color(0xFF1D1D1D);
  String catIcon = "";
  List<CategoryModel> categories = [];
  int selectedColor = 0;

  int selectedIcon = 0;

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
            SizedBox(height: 10.h),
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
                          setState(() {
                              selectedColor = 1;
                          });
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
                      catIcon = icons[index];
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child:SvgPicture.asset(icons[index] , width: 70,fit : BoxFit.cover),
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
                      categoryModel = categoryModel.copyWith(color: color,iconPath: catIcon,name: categoryNameController.text);
                      widget.iconnn.call(catIcon);
                      widget.texttt.call(categoryNameController.text);
                      widget.colorrr.call(color);
                      setState(() {

                      });
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
