import 'package:flutter/material.dart';
import 'package:food_app/core/colors.dart';

class ButtonComponent extends StatelessWidget {
  final onPress;
  final String? text;
  final double? width;

  const ButtonComponent({Key? key, this.onPress, this.text, this.width = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: baseColor,
        ),
        onPressed: onPress,
        child: Text(
          text!,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
