import 'package:flutter/material.dart';
import 'package:tofo/consts/extension.dart';
import 'package:tofo/models/task_model.dart';

class TaskCard extends StatelessWidget {
  TaskCard({
    Key? key,
    required this.onTap,
    required this.taskModel,
  }) : super(key: key);
  TaskModel taskModel;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            decoration: BoxDecoration(
              color: taskModel.taskColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        taskModel.taskName
                            .appText(fontWeight: FontWeight.w500, size: 18),
                        5.spaceH(),
                        taskModel.taskDescription
                            .appText(fontWeight: FontWeight.w400, size: 15),
                      ],
                    )),
                    (taskModel.isStart ? taskModel.taskTime : "Start")
                        .appText(fontWeight: FontWeight.w500, size: 18),
                    5.spaceW(),
                    Visibility(
                        visible: taskModel.isStart && !taskModel.isComplete,
                        child: SizedBox(
                          height: 50,
                          width: 80,
                          child: Card(
                              color: Colors.red,
                              child: Center(
                                child: "Stop".appText(
                                    fontWeight: FontWeight.w500, size: 18),
                              )),
                        ))
                  ],
                )),
          ),
        ));
  }
}
