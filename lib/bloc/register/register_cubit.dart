import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/models/request_register_model.dart';
import 'package:food_app/models/response_register_model.dart';
import 'package:meta/meta.dart';

import '../../models/response_login_model.dart';
import '../../services/dio/dio_helper.dart';
import '../../services/dio/endpoints.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  late ResponseRegisterModel responseModel;

  // Future<void> register(
  //     String email, String password, String name, String phone) async {
  //   emit(RegisterLoadingState());
  //   await DioHelper.postData(
  //     url: Endpoints.register,
  //     data: RequestRegisterModel(
  //             email: email, password: password, name: name, phone: phone).toJson(),
  //   ).then((value) {
  //     print(value.data);
  //     responseModel=ResponseRegisterModel.fromJson(value.data);
  //     if (value.data['status']) {
  //       emit(RegisterSuccessfulState());
  //     } else {
  //       emit(RegisterErrorState());
  //     }
  //   }).catchError((error) {
  //     emit(RegisterErrorState());
  //   });
  // }
}
