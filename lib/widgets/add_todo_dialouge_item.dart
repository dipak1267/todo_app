import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:tofo/consts/extension.dart';
import 'package:tofo/widgets/app_text_field.dart';

class AddTodoDialogueItem extends StatelessWidget {
  AddTodoDialogueItem({
    Key? key,
    required this.taskController,
    required this.taskDesController,
    required this.color,
    required this.onColorChoose,
    required this.onSubmit,
  }) : super(key: key);
  TextEditingController taskController;
  TextEditingController taskDesController;
  Function onSubmit;
  Function onColorChoose;
  Color color;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: "Add Todo Task".appText(size: 18, fontWeight: FontWeight.w500),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                AppTextField(
                    controller: taskController,
                    hintText: "Task Tittle",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "please add Task Tittle";
                      }
                      return null;
                    }),
                10.spaceH(),
                AppTextField(
                  controller: taskDesController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "please add Task Description";
                    }
                    return null;
                  },
                  hintText: 'Task Description',
                ),
                20.spaceH(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Material(
                                  child: MaterialColorPicker(
                                    selectedColor: color,
                                    onColorChange: (color) {
                                      onColorChoose(color);
                                      Navigator.of(context).pop();
                                    },
                                    onBack: () => print("Back button pressed"),
                                  ),
                                ));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:
                            BoxDecoration(color: color, shape: BoxShape.circle),
                      ),
                    ),
                    5.spaceW(),
                    Expanded(
                      child: "Tap on color icon to change task color"
                          .appText(size: 15, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onSubmit();
                        Navigator.of(context).pop();
                      }
                    },
                    child: "Add Task"
                        .appText(fontWeight: FontWeight.w500, size: 15))
              ],
            ))
      ],
    );
  }
}
