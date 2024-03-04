import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/data/local/local_database.dart';
import 'package:to_do_app/data/models/task_model.dart';
import 'package:to_do_app/screens/routes.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

class TitleInfoScreen extends StatefulWidget {
  const TitleInfoScreen({
    super.key,
    required this.text,
  });

  final TaskModel text;

  @override
  State<TitleInfoScreen> createState() => _TitleInfoScreenState();
}


class _TitleInfoScreenState extends State<TitleInfoScreen> {

  TaskModel taskModel = TaskModel.initialValue;
  List<TaskModel> tasks = [];
 LocalDatabase delete = LocalDatabase.databaseInstance;
  List<TaskModel> description = [];
  _init() async {
    tasks = await LocalDatabase.getAllTasks();
setState(() {

});
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
            Navigator.pushNamed(context, RouteNames.taskScreen, arguments: () async {
              tasks = await LocalDatabase.getAllTasks();
              setState(() {});
            });
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 24.sp,
          ),
        ),
        title: Text(
          "Reja haqida",
          style: AppTextStyle.robotoThinItalic.copyWith(color: Colors.white, fontSize: 18.sp),
        ),
        actions: [
          IconButton(onPressed: ()  {
            // int d = await LocalDatabase.deleteTask(taskModel.id!);
            // debugPrint("DELETED ID:$d");
            // _init();
            // Navigator.pop(context);
          }, icon: Icon(Icons.edit),color: Colors.green,),
          IconButton(onPressed: ()async{
              int d = await LocalDatabase.deleteTask(taskModel.id!);
              debugPrint("DELETED ID:$d");
              _init();
              Navigator.pop(context);

          }, icon: Icon(Icons.delete,color: Colors.red,))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reja nomi:  ${widget.text.description}",
              style: AppTextStyle.robotoBold.copyWith(color: AppColors.white, fontSize: 18.sp),
            ),
            SizedBox(height: 15.h,),
            Text("Reja: ${widget.text.title}", style: AppTextStyle.robotoMedium.copyWith(color: Colors.white, fontSize: 18.sp),),
          ],
        ),
      ),
    );
  }
}
