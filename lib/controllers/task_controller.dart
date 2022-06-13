import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tofo/consts/colors.dart';

import '../models/task_model.dart';

class TaskController extends GetxController {
  String listId = "listId";
  List<TaskModel> todoTasks = [];
  TextEditingController taskNameCtrl = TextEditingController();
  TextEditingController taskDescriptionCtrl = TextEditingController();
  Color taskColor = defaultListItemColor;
  Timer? myTimer;

  addTask() {
    todoTasks.add(TaskModel(
        taskName: taskNameCtrl.text,
        taskColor: taskColor,
        time: const Duration(microseconds: 0),
        taskDescription: taskDescriptionCtrl.text,
        isStart: false));
    taskNameCtrl.clear();
    taskDescriptionCtrl.clear();
    taskColor = defaultListItemColor;

    update([listId]);
  }

  changeTimer({required int index, required bool isStart}) {
    for (var task in todoTasks) {
      if (task.isStart) {
        task.isComplete = true;
      }
    }

    if (isStart) {
      // todoTasks[index].isComplete = true;
      myTimer?.cancel();
      todoTasks[index].isStart = true;
      myTimer = null;
      myTimer = Timer.periodic(
          const Duration(seconds: 1), (t) => {incrementTimer(index)});
    } else {
      isStart = false;
      todoTasks[index].isComplete = true;
      myTimer?.cancel();
      myTimer = null;
    }

    update([listId]);
  }

  incrementTimer(int index) {
    todoTasks[index].time =
        Duration(seconds: todoTasks[index].time.inSeconds + 1);
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(todoTasks[index].time.inHours);
    final minutes = strDigits(todoTasks[index].time.inMinutes.remainder(60));
    final seconds = strDigits(todoTasks[index].time.inSeconds.remainder(60));
    todoTasks[index].taskTime = "$hours:$minutes:$seconds";

    update([listId]);
  }
}
