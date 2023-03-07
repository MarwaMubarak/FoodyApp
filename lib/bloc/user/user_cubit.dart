
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/core/navigate.dart';
import 'package:food_app/models/logout_response_model.dart';
import 'package:food_app/models/request_login_model.dart';
import 'package:food_app/models/response_login_model.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/services/dio/dio_helper.dart';
import 'package:food_app/services/dio/endpoints.dart';
import 'package:food_app/services/firebase/authentication.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
// import com.facebook.FacebookSdk;
// import com.facebook.appevents.AppEventsLogger;


import '../../core/colors.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);

  // late UserModel userModel;
  final UserModel userModel=UserModel(
      id: 1,
      name: "Marwa",
      email: "email.com",
      phone: "0123456789",
      image: "",
      points: 0,
      credit: 0,
      token: "");

  // late ResponseLoginModel responseModel;
  // late LogoutResponseModel logoutResponseModel;
  late  User? user;

  Future<dynamic> login(String email, String password,context) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch  (e) {
      Fluttertoast.showToast(
            msg: e.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: baseColor,
            textColor: Colors.white,
            fontSize: 16.0);
    }
    user = FirebaseAuth.instance.currentUser;
    Navigate.navigateWithoutBack(context, Authentication());
    emit(LoginSuccessfulState());
  }

  Future<dynamic> register(String email, String password, context) async {
    try
    {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      user=FirebaseAuth.instance.currentUser;

      Navigate.navigateWithoutBack(context, LoginScreen());

    }on FirebaseAuthException catch  (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: baseColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    emit(RegisterState());
  }

  Future<dynamic> logout(context) async {
   try {
      await FirebaseAuth.instance.signOut();
    }on FirebaseAuthException catch  (e) {
     Fluttertoast.showToast(
         msg: e.message.toString(),
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor: baseColor,
         textColor: Colors.white,
         fontSize: 16.0);
   }
    Navigate.navigateAndRemoveAll(context, Authentication());
    emit(LogoutState());
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    {
      try{
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleSignInAccount = await googleSignIn
            .signIn();
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
          final AuthCredential authCredential = GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken);
          UserCredential result = await FirebaseAuth.instance
              .signInWithCredential(authCredential);
          user = result.user;

          if (result != null) {
            Navigate.navigateWithoutBack(context, HomeScreen());
          }
        }
      }on FirebaseAuthException catch  (e) {
        Fluttertoast.showToast(
            msg: e.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: baseColor,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      emit(GoogleState());
  }


}

  Future<dynamic> signInWithFacebook(context)async{
    try{
      FacebookLogin facebookLogin = FacebookLogin();
      FacebookLoginResult result = await facebookLogin.logIn();
      final accessToken = result.accessToken!.token;
      if (result.status == FacebookLoginStatus.success) {
        final credential = FacebookAuthProvider.credential(accessToken);
        await FirebaseAuth.instance.signInWithCredential(credential);
        user = FirebaseAuth.instance.currentUser;
        print(user!.email.toString());
        Navigate.navigateWithoutBack(context, Authentication());
      }
    }on FirebaseAuthException catch  (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: baseColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    emit(FacebookState());
  }

}









// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();
//
//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }

// dio login
// Future<dynamic>login(String email, String password)async{
//   emit(LoginLoadingState());
//   await DioHelper.postData(url: Endpoints.login,data: RequestLoginModel(email: email, password: password).toJson(),).then((value)  {
//     print(value.statusCode.toString()+'++++++++');
//     print(value.data.toString()+'****************************');
//     responseModel=ResponseLoginModel.fromJson(value.data);
//     if(value.data['status']) {
//       userModel =  UserModel.fromJson(value.data['data']);
//       print(userModel.name+'+++++++++++++++++++++++++++++++++++++');
//       emit(LoginSuccessfulState());
//     }else{
//       emit(LoginErrorState());
//     }
//   }).catchError((error){
//
//     emit(LoginErrorState());
//   });
// }

// Future<dynamic>logout()async{
//   await DioHelper.postData(url: Endpoints.logout,token: user.token, data: {}).then((value)  {
//     logoutResponseModel=LogoutResponseModel.fromJson(value.data);
//     if(value.data['status']) {
//       emit(LogoutState());
//     }else{
//       emit(LogoutErrorState());
//     }
//   }).catchError((error){
//
//     emit(LogoutErrorState());
//   });
// }
