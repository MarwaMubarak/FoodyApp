part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class LoginLoadingState extends UserState {}
class LoginSuccessfulState extends UserState {}
class LoginErrorState extends UserState {}
class LogoutState extends UserState {}
class LogoutErrorState extends UserState {}
class RegisterState extends UserState {}
class GoogleState extends UserState {}
class FacebookState extends UserState {}





