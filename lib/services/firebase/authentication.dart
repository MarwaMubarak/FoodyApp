import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/login_screen.dart';
class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder:((context,snapshot){
          if(snapshot.hasData){
            return const HomeScreen();
          }else{
            return LoginScreen();
          }
        })
    );
  }
}
