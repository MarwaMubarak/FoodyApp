import 'package:flutter/material.dart';
import 'package:food_app/core/components/item_component.dart';
import 'package:food_app/models/item_model.dart';

class ListViewComponent extends StatelessWidget {
  List<ItemModel>? list;
  final bool?viewOnly;
  // final addFun;
  // final removeFun;
  // required this.addFun,required this.removeFun

  ListViewComponent({
    required this.list,
    this.viewOnly=false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return ItemComponent(
          // addfun: addFun,
          // removeFun: removeFun,
          idx: index,
          image: list![index].image,
          price: list![index].price,
          name: list![index].name,
          viewOnly: viewOnly,
        );
      },
      itemCount: list!.length,
    );
  }
}
