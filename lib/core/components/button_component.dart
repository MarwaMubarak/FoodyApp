import 'package:flutter/material.dart';
import 'package:food_app/core/colors.dart';

class ButtonComponent extends StatelessWidget {
  final onPress;
  final String? text;
  final double? width;
  final Color? color;
  final Color? textColor;
  final String?img;
  final double? scale;

  const ButtonComponent({Key? key, this.onPress, this.text, this.width = 100,this.color=baseColor,this.textColor=white,this.img,this.scale=100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: color,
        ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (img!=null)?Image.asset(img!,scale: scale!,):const SizedBox(height: 0,width: 0,),
            Text(
              text!,
              style:
                   TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
