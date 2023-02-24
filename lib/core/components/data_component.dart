import 'package:flutter/material.dart';

import '../colors.dart';
class DataComponent extends StatelessWidget {
  String? name;
  String? value;
  DataComponent({required this.name,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(width: 25,),
            Text('${name!}  ',style: TextStyle(color: baseColor,fontSize: 16,fontWeight: FontWeight.bold),),
            Text('${value!}  ',style: TextStyle(color: Colors.black,fontSize: 16),),

          ],
        ),
      ),
    )
    ;
  }
}
