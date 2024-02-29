import 'package:flutter/material.dart';
import 'package:to_do_app/utils/size/size_utils.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Categoriya qo'shing ",
          style: AppTextStyle.robotoMedium.copyWith(
            color: Colors.white,
            fontSize: 24.h,
          ),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
