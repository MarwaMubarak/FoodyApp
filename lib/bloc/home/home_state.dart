
part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class AddState extends HomeState {}
class RemoveState extends HomeState {}
class BuyState extends HomeState {}
class SelectState extends HomeState {}

