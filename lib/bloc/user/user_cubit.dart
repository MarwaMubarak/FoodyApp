import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/navigate.dart';
import 'package:food_app/models/logout_response_model.dart';
import 'package:food_app/models/request_login_model.dart';
import 'package:food_app/models/response_login_model.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/services/dio_helper.dart';
import 'package:food_app/services/endpoints.dart';
import 'package:meta/meta.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
   static UserCubit get(context) => BlocProvider.of(context);
  late UserModel user;
   late ResponseLoginModel responseModel;
   late LogoutResponseModel logoutResponseModel;
  
  Future<dynamic>login(String email, String password)async{
    emit(LoginLoadingState());
    await DioHelper.postData(url: Endpoints.login,data: RequestLoginModel(email: email, password: password).toJson(),).then((value)  {
      print(value.statusCode.toString()+'++++++++');
      print(value.data.toString()+'****************************');
      responseModel=ResponseLoginModel.fromJson(value.data);
      if(value.data['status']) {
        user =  UserModel.fromJson(value.data['data']);
        print(user.name+'+++++++++++++++++++++++++++++++++++++');
        emit(LoginSuccessfulState());
      }else{
        emit(LoginErrorState());
      }
    }).catchError((error){

      emit(LoginErrorState());
    });
  }
  Future<dynamic>logout()async{
    await DioHelper.postData(url: Endpoints.logout,token: user.token, data: {}).then((value)  {
      logoutResponseModel=LogoutResponseModel.fromJson(value.data);
      if(value.data['status']) {
        emit(LogoutState());
      }else{
        emit(LogoutErrorState());
      }
    }).catchError((error){

      emit(LogoutErrorState());
    });
  }


}
