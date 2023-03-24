import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/input_add_grocery_controller.dart';

class InputAddGrocery extends GetView<InputAddGroceryController> {
  const InputAddGrocery({Key? key, this.callback}) : super(key: key);

  final Function? callback;

  @override
  TextField build(BuildContext context) {
    return TextField(
      controller: controller.textFieldAddGroceryController,
      decoration: const InputDecoration(
        hintText: 'I.e. : Carrot',
      ),
      onSubmitted: (value) {
        controller.addToList(value);
        callback!();
      },
    );
  }
}
