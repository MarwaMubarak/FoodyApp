import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/home/home_cubit.dart';
import 'package:food_app/bloc/home/home_cubit.dart';
import 'package:food_app/core/colors.dart';

class ItemComponent extends StatelessWidget {
  final String? image;
  final String? price;
  final String? name;
  final int? idx;
  final bool? viewOnly;

  // final addfun;
  // final removeFun;
  //required this.addfun,required this.removeFun

  ItemComponent(
      {Key? key, required this.image, required this.price, required this.name,this.idx,this.viewOnly=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        return SizedBox(
          height: 190,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
                side: BorderSide(
                  color: grayColor,
                ),
              ),
              shadowColor: grayColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image(image: AssetImage(image!),
                          height: 110,
                          width: 110,
                        )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        name!,
                        style: TextStyle(
                            color: baseColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      (!viewOnly!)? Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: TextButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: baseColor,
                                  primary: baseColor,
                                  shape: CircleBorder(
                                      side: BorderSide(
                                        color: baseColor,
                                      ))),
                              onPressed: () {
                                cubit.add(idx);
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: TextButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: baseColor,
                                  primary: baseColor,
                                  shape: CircleBorder(
                                      side: BorderSide(
                                        color: baseColor,
                                      ))),
                              onPressed: () {
                                cubit.remove(idx);
                              },
                              child: const Icon(
                                Icons.remove_rounded,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ):Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
