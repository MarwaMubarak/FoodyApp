import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/core/navigate.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/services/firebase/authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Image(
            image: AssetImage('assets/images/Foody.png'),
          )),
    );
  }

  startTime() {
    var duration = const Duration(seconds: 1);
    Timer(duration, route);
  }

  route() {
    Navigate.navigateWithoutBack(context, const Authentication());
  }
}
