import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/components/list_view_component.dart';
import '../../models/item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 1;
  List<ItemModel> order = [];
  int orderCost=0;

  List<ItemModel> food = [
    ItemModel(
        name: 'Meat Sandwich', image: 'assets/images/meat.jpg', price: '45LE'),
    ItemModel(
        name: 'Chicken Sandwich',
        image: 'assets/images/chicken.jpg',
        price: '40LE'),
    ItemModel(
        name: 'Burger Sandwich',
        image: 'assets/images/burger.jpg',
        price: '49LE'),
    ItemModel(
        name: 'Lanshon Sandwich',
        image: 'assets/images/lanshon.jpg',
        price: '30LE'),
    ItemModel(name: 'Pizza ', image: 'assets/images/pizza.jpg', price: '66LE'),
    ItemModel(
        name: 'Shawerma', image: 'assets/images/shawerma.jpg', price: '55LE'),
  ];
  List<ItemModel> drinks = [
    ItemModel(name: 'Banana', image: 'assets/images/banana.jpg', price: '30LE'),
    ItemModel(name: 'Lemon', image: 'assets/images/lemon.jpg', price: '22LE'),
    ItemModel(name: 'Mango', image: 'assets/images/mango.jpg', price: '66LE'),
    ItemModel(
        name: 'Nescafe', image: 'assets/images/nescafe.jpg', price: '23LE'),
    ItemModel(name: 'Pepsi', image: 'assets/images/pepsi.jpg', price: '16LE'),
    ItemModel(name: 'Tea', image: 'assets/images/tea.jpg', price: '11LE'),
  ];
  List<ItemModel> sweets = [
    ItemModel(
        name: 'Chocolate Cake',
        image: 'assets/images/cake.jpg',
        price: '450LE'),
    ItemModel(name: 'Candy', image: 'assets/images/candy.jpg', price: '25LE'),
    ItemModel(
        name: 'Cupcake', image: 'assets/images/cupcake.jpg', price: '50LE'),
    ItemModel(name: 'Donuts', image: 'assets/images/donuts.jpg', price: '27LE'),
    ItemModel(
        name: 'Ice-Cream', image: 'assets/images/ice-cream.jpg', price: '39LE'),
    ItemModel(
        name: 'Strawberry Ice-cream',
        image: 'assets/images/strawberry.jpg',
        price: '53LE'),
  ];

  selectIndex(int idx) {
    selectedIndex = idx;
    emit(SelectState());
  }

  add(idx) {
    ItemModel? item;
    if (selectedIndex == 0) {
      item = sweets[idx];
    } else if (selectedIndex == 1) {
      item = food[idx];
    } else if (selectedIndex == 2) {
      item = drinks[idx];
    }
    int itemCost=int.parse(item!.price![0])*10+int.parse(item.price![1]);
    orderCost+=itemCost;
    print(itemCost.toString()+'cost'+orderCost.toString());

    order.add(item);
    print('------*');
    for (int i = 0; i < order.length; i++) {
      print(order[i].name);
    }
    emit(AddState());
  }

  remove(idx) {
    ItemModel? item;
    if (selectedIndex == 0) {
      item = sweets[idx];
    } else if (selectedIndex == 1) {
      item = food[idx];
    } else if (selectedIndex == 2) {
      item = drinks[idx];
    }
    int itemCost=int.parse(item!.price![0])*10+int.parse(item.price![1]);
    orderCost-=itemCost;
    print(itemCost.toString()+'cost'+orderCost.toString());
    order.remove(item);
    print('------*');
    for (int i = 0; i < order.length; i++) {
      print(order[i].name);
    }
    emit(RemoveState());
  }
  buy(){
    order.clear();
    orderCost=0;
    emit(BuyState());
  }
}
