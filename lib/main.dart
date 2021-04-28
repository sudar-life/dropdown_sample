import 'package:flutter/material.dart';
import 'package:flutter_dropdown_sample/src/app.dart';
import 'package:flutter_dropdown_sample/src/controller/dropdown_button_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(DropdownButtonController());
      }),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}
