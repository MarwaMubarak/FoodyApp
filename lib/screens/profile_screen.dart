import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/core/components/button_component.dart';
import 'package:food_app/core/components/data_component.dart';
import 'package:food_app/core/navigate.dart';
import 'package:food_app/screens/login_screen.dart';

import '../bloc/user/user_cubit.dart';
import '../core/colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            centerTitle: true,
            backgroundColor: baseColor,
            title: const Text('Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DataComponent(name: 'Username: ', value: cubit.user.name),
                DataComponent(name: 'Email: ', value: cubit.user.email),
                DataComponent(name: 'Phone: ', value: cubit.user.phone),
                DataComponent(
                    name: 'Credit: ', value: cubit.user.credit.toString()),
                DataComponent(
                    name: 'Points: ', value: cubit.user.points.toString()),
                SizedBox(
                  height: 20,
                ),
                ButtonComponent(
                  text: 'Logout',
                  width: 200,
                  onPress: () async {
                    await cubit.logout();
                    if (cubit.logoutResponseModel.status) {
                      Navigate.navigateAndRemoveAll(context, LoginScreen());
                    }
                    Fluttertoast.showToast(
                        msg: cubit.logoutResponseModel.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: baseColor,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
