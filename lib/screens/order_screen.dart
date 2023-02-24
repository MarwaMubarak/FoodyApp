import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/bloc/home/home_cubit.dart';
import 'package:food_app/core/components/list_view_component.dart';

import '../core/colors.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          //resizeToAvoidBottomInset: true,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            centerTitle: true,
            backgroundColor: baseColor,
            title: const Text('Your Order',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),

          body: Column(
            children: [
              Expanded(
                  child: ListViewComponent(list: cubit.order, viewOnly: true)),
              SizedBox(
                height: 20,
                child: Text(
                  'You Will Pay ${cubit.orderCost}LE',
                  style: TextStyle(
                      color: baseColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 130,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    primary: baseColor,
                  ),
                  onPressed: () {
                    cubit.buy();
                    Fluttertoast.showToast(
                        msg: 'Done Successfully..\n Thanks for being here :) ',
                        textColor: Colors.white,
                        backgroundColor: baseColor,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3);
                  },
                  child: const Text(
                    'Buy',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }
}
