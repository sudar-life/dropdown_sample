import 'package:flutter/material.dart';
import 'package:flutter_dropdown_sample/src/controller/dropdown_button_controller.dart';
import 'package:get/get.dart';

class DropDownCustomWidget extends GetView<DropdownButtonController> {
  const DropDownCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DropDownList(),
          opaque: false,
          transition: Transition.fadeIn,
        );
      },
      child: Container(
        height: 50,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 15),
        child: Obx(
          () => Row(
            children: [
              Expanded(child: Text(controller.currentItem.value.name)),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDownList extends GetView<DropdownButtonController> {
  DropDownList();

  Widget _dropDownList() {
    return Column(
      children: List.generate(
        DropdownMenu.values.length,
        (index) => _dropDownOne(DropdownMenu.values[index].name, index),
      ),
    );
  }

  Widget _dropDownOne(String label, int index) {
    return GestureDetector(
      onTap: () {
        controller.changeDropDownMenu(index);
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Text(label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: Get.back,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: controller.dropdownPositionY,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: _dropDownList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
