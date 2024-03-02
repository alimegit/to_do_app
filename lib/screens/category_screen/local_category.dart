import 'package:flutter/material.dart';
import 'package:to_do_app/data/models/category/category_model.dart';
import 'package:to_do_app/data/models/task_model.dart';
import 'package:to_do_app/utils/images/app_images.dart';

List<CategoryModel> categories = [];

List<TaskModel> tasks = [];

const List<Color> colors = [
  Color(0xFF1D1D1D),
  Colors.red,
  Colors.blue,
  Colors.orange,
  Colors.yellowAccent,
  Colors.tealAccent,
  Colors.purpleAccent,
  Colors.white10,
  Colors.pinkAccent,
  Colors.limeAccent,
  Colors.lightBlueAccent,
  Colors.deepPurpleAccent,
  Colors.blueGrey,
  Colors.lime,
  Colors.amber,
];
const List<String> icons = [
  AppImages.delete,
  AppImages.menu,
  AppImages.tasks,
  AppImages.calendar,
  AppImages.profileIcon,

];
