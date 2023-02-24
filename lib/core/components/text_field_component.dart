import 'package:flutter/material.dart';
import 'package:food_app/core/colors.dart';

class TextFieldComponent extends StatelessWidget {
  final icon;
  final String? label;
  final onChangeFun;
  final controller;
  final validator;
  final bool? isPass;
  final double? height;

  const TextFieldComponent(
      {Key? key,
      this.height = 60,
      this.icon,
      required this.label,
      this.onChangeFun,
      required this.controller,
      this.validator,
      this.isPass = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      width: 320,
      height: height,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: isPass!,
        decoration: InputDecoration(
          fillColor: baseColor,
          labelText: label,
          labelStyle: TextStyle(color: baseColor, fontWeight: FontWeight.bold),
          prefixIcon: Icon(
            icon,
            color: grayColor,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: baseColor,
                width: 1.5,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: baseColor,
                width: 1.5,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: baseColor,
                width: 1.5,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: baseColor,
                width: 1.5,
              )),
        ),
        onChanged: (value) {},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'required field!';
          }
          return null;
        },
      ),
    );
  }
}
