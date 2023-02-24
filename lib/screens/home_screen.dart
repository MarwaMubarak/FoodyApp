import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/home/home_cubit.dart';
import 'package:food_app/core/components/list_view_component.dart';
import 'package:food_app/core/navigate.dart';
import 'package:food_app/screens/order_screen.dart';
import 'package:food_app/screens/profile_screen.dart';

import '../core/colors.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=HomeCubit.get(context);

        List<Widget> options = <Widget>[
          ListViewComponent(list:cubit.sweets,),
          ListViewComponent(list: cubit.food,),
          ListViewComponent(list:cubit.drinks),
        ];
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigate.navigateWithBack(context,  ProfileScreen());
                  },
                  icon: const Icon(Icons.person, color: Colors.white, size: 16,)
              )
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            centerTitle: true,
            backgroundColor: baseColor,
            title: const Text('Foody',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.selectedIndex,
             selectedItemColor: baseColor,
            onTap: (idx) {
                cubit.selectIndex(idx);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.icecream),
                label: 'Sweets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.food_bank),
                label: 'Food',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_drink),
                label: 'Drinks',
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: baseColor,
            onPressed: () {
              Navigate.navigateWithBack(context, const OrderScreen());
            },
            child: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
          ),
          body: options.elementAt(cubit.selectedIndex),
        );
      },
    );
  }
}
