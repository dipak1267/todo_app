import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tofo/consts/extension.dart';
import 'package:tofo/controllers/task_controller.dart';
import 'package:tofo/widgets/add_todo_dialouge_item.dart';

import '../widgets/task_card.dart';

class TaskListScreen extends StatelessWidget {
  TaskListScreen({Key? key}) : super(key: key);
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => GetBuilder<TaskController>(
                      builder: (controller) {
                        return AddTodoDialogueItem(
                          taskController: controller.taskNameCtrl,
                          color: controller.taskColor,
                          taskDesController: controller.taskDescriptionCtrl,
                          onSubmit: () {
                            controller.addTask();
                          },
                          onColorChoose: (color) {
                            controller.taskColor = color;
                            controller.update();
                          },
                        );
                      },
                    ));
          },
        ),
        body: GetBuilder<TaskController>(
          id: taskController.listId,
          builder: (ctrl) {
            return ctrl.todoTasks.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: "Add Tasks Todo"
                            .appText(fontWeight: FontWeight.w500, size: 18),
                      )
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    itemCount: ctrl.todoTasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        taskModel: ctrl.todoTasks[index],
                        onTap: () {
                          if (ctrl.todoTasks[index].isStart) {
                            ctrl.todoTasks[index].isComplete = true;
                            ctrl.changeTimer(index: index, isStart: false);
                          } else {
                            ctrl.changeTimer(index: index, isStart: true);
                          }
                          ctrl.update();
                        },
                      );
                    },
                  );
          },
        ));
  }
}
