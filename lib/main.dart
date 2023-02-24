import 'package:flutter/material.dart';
import 'package:food_app/services/dio_helper.dart';
import 'package:food_app/src/app_root.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const AppRoot());
}
