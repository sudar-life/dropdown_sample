import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dropdown_button_controller.dart';

class PopupMenuButtonWidget extends GetView<DropdownButtonController> {
  const PopupMenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 0,
      onSelected: (int? index) {
        controller.changeDropDownMenu(index);
      },
      offset: Offset(0, 0),
      shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          RoundedRectangleBorder(),
          0),
      itemBuilder: (BuildContext context) {
        return List.generate(
          DropdownMenu.values.length,
          (index) => PopupMenuItem(
            value: index,
            child: Text(DropdownMenu.values[index].name),
          ),
        ).toList();
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.only(left: 20),
          child: Text(controller.currentItem.value.name),
        ),
      ),
    );
  }
}
