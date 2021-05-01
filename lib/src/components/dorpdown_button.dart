import 'package:flutter/material.dart';
import 'package:flutter_dropdown_sample/src/controller/dropdown_button_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DropdownButtonWidget extends GetView<DropdownButtonController> {
  final bool isExpanded;
  DropdownButtonWidget({Key? key, this.isExpanded = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
        value: controller.currentItem.value.index,
        onChanged: (int? value) {
          controller.changeDropDownMenu(value);
        },
        underline: Container(),
        isExpanded: isExpanded,
        items: DropdownMenu.values
            .map(
              (menu) => DropdownMenuItem(
                value: menu.index,
                child: Text(menu.name),
              ),
            )
            .toList(),
      ),
    );
  }
}
