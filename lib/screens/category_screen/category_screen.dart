import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/data/models/category/category_model.dart';
import 'package:to_do_app/screens/category_screen/local_category.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});


  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController categoryNameController = TextEditingController();
  List<String> categories = [
    "work",
    "study",
    "sport",
    "design",
    "music",
    "home",
    "movie"
  ];
  CategoryModel categoryModel = CategoryModel.initialValue;
  Color color =  Color(0xFF1D1D1D);
  Icon icon = Icon(Icons.work);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_242443,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: AppColors.white,size: 24.sp,),),
        title: Text("Categoriya qo'shish",style: AppTextStyle.robotoThinItalic.copyWith(color: Colors.white,fontSize: 18.sp),),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0,left: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 10,),
                 Padding(
                   padding: EdgeInsets.only(top: 35.h,left: 15,right: 15),
                   child: TextField(
                     textInputAction: TextInputAction.next,
                     controller: categoryNameController,
                     decoration: InputDecoration(
                       enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                       labelText:  "Categoriya nomi",
                       labelStyle: TextStyle(color: Colors.white10,fontSize: 14.sp),
                     ),
                   ),
                 ),
            SizedBox(height: 33,),
            Text("Category color :",style: AppTextStyle.robotoThinItalic.copyWith(fontSize: 16.sp,color: Colors.white),),
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
            SizedBox(height: 15.h,),
            Text("Category icon :",style: AppTextStyle.robotoThinItalic.copyWith(fontSize: 16.sp,color: Colors.white),),
            SizedBox(
           height: 60,
              child: ListView.builder(
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  final iconItem = icons[index];
                  return ZoomTapAnimation(
                    onTap: () {
                      icon = icons[index];
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

          ],

        ),
      ),
    );
  }
}
