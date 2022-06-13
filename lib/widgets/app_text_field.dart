import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.validator})
      : super(key: key);
  String hintText;
  TextEditingController controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: borderColor!),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          //border: InputBorder.none,
          fillColor: Colors.white,
          hintText: hintText,
          // hintStyle: GoogleFonts.openSans(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          alignLabelWithHint: true),
    );
  }
}
