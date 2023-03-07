import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/services/dio/dio_helper.dart';
import 'package:food_app/src/app_root.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //DioHelper.init();
  runApp(const AppRoot());
}
