import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/size/size_utils.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController categoryNameController = TextEditingController();
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
        padding: EdgeInsets.only(top: 33,left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 33.h,),
                 Padding(
                   padding: EdgeInsets.only(top: 35.h,left: 15.w,right: 15.w),
                   child: TextField(
                     controller: categoryNameController,
                     decoration: InputDecoration(
                       enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                       labelText:  "Categoriya nomi",
                       labelStyle: TextStyle(color: Colors.white10,fontSize: 14.sp),
                     ),
                   ),
                 ),

          ],
        ),
      ),
    );
  }
}
