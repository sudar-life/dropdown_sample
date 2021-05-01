import 'package:flutter/material.dart';
import 'package:flutter_dropdown_sample/src/components/dorpdown_button.dart';
import 'package:flutter_dropdown_sample/src/components/dropdown_button_custom.dart';
import 'package:flutter_dropdown_sample/src/controller/dropdown_button_controller.dart';
import 'package:flutter_dropdown_sample/src/pages/default.dart';
import 'package:flutter_dropdown_sample/src/pages/page1.dart';
import 'package:flutter_dropdown_sample/src/pages/page2.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class App extends GetView<DropdownButtonController> {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropDownCustomWidget(
              key: controller.dropKey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButtonWidget(),
                DropdownButtonWidget(),
              ],
            ),
            Obx(() {
              Widget page = Center(child: CircularProgressIndicator());
              switch (controller.currentItem.value) {
                case DropdownMenu.DEFAULT:
                  page = Expanded(child: Default());
                  break;
                case DropdownMenu.VALUE1:
                  page = Expanded(child: Page1());
                  break;
                case DropdownMenu.VALUE2:
                  page = Expanded(child: Page2());
                  break;
              }
              return page;
            }),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom),
        child: DropdownButtonWidget(isExpanded: true),
      ),
    );
  }
}

//
