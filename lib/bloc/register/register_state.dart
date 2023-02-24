part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessfulState extends RegisterState {}
class RegisterErrorState extends RegisterState {}

