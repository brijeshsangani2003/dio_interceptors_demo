import 'dart:developer';

import 'package:dio_interceptors_demo/model/user_model.dart';
import 'package:dio_interceptors_demo/repositories/Api_services.dart';
import 'package:dio_interceptors_demo/repositories/services.dart';
import 'package:dio_interceptors_demo/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // List<UserModel>? userList = await Services().user();
  // print(userList.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}
