import 'package:flutter/material.dart';

class TaskModel {
  String taskName;
  Color taskColor;
  String taskDescription;
  String taskTime;
  bool isStart;
  bool isComplete;
  Duration time;

  TaskModel(
      {required this.taskName,
      required this.taskColor,
      required this.taskDescription,
      required this.time,
      this.taskTime = "",
      this.isComplete = false,
      this.isStart = false});
}
