import 'package:flutter/material.dart';
import 'package:game/HomeBinding.dart';
import 'package:game/HomePage.dart';

import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';


void main() async{
  //await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomePage(),
      initialBinding: HomeBinding(),


    );
  }
}