import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/data/models/task_model.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';
class TitleInfoScreen extends StatefulWidget {
  const TitleInfoScreen({super.key});

  @override
  State<TitleInfoScreen> createState() => _TitleInfoScreenState();
}

class _TitleInfoScreenState extends State<TitleInfoScreen> {
 TaskModel taskModel = TaskModel.initialValue;
 List<TaskModel> tasks = [];
 List<TaskModel> description = [];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_242443,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: AppColors.white,size: 24.sp,),),
        title: Text("Reja haqida",style: AppTextStyle.robotoThinItalic.copyWith(color: Colors.white,fontSize: 18.sp),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(taskModel.description,style: AppTextStyle.robotoMedium.copyWith(color: Colors.white,fontSize: 18.sp),),
          Text(taskModel.title,style: AppTextStyle.robotoMedium.copyWith(color: Colors.white,fontSize: 40.sp),),
          Text(taskModel.description,style: AppTextStyle.robotoMedium.copyWith(color: Colors.white,fontSize: 40.sp),),
        ],
      ),
    );
  }
}
