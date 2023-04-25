import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/Widgets/custom_bottom_navigation_bar/presentation/controllers/custom_bottom_navigation_bar_controller.dart';
import '../../../../shared/Widgets/custom_bottom_navigation_bar/presentation/view/custom_bottom_navigation_bar.dart';
import '../../models/grocery.dart';
import '../controllers/grocery_list_controller.dart';

class GroceryListPage extends GetView<GroceryListController> {
  GroceryListPage({Key? key}) : super(key: key);

  final CustomBottomNavigationBarController navigationControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller.textFieldAddGroceryController,
          decoration: const InputDecoration(
            hintText: 'I.e. : Carrot',
          ),
          onSubmitted: (value) => controller.afterAddToList(value),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state!.groceries.length,
          itemBuilder: (
            context,
            index,
          ) =>
              buildItem(state.groceries[index], index, 60.0),
        ),
        onError: (error) => const Text("An error has occured, please refresh"),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Center(
          child: Text("No grocery written in the list"),
        ),
      ),
    );
  }

  Widget buildItem(
    Grocery item,
    int index,
    double height,
  ) =>
      Dismissible(
        key: UniqueKey(),
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: const BoxDecoration(
                color: Color(0xffEEEEEE),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.delete),
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => controller.removeGrocery(item),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          color: index.isEven ? const Color(0xffeeeeee) : null,
          height: height,
          child: Row(
            children: [
              Text(item.name),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => controller.decrementQuantity(item),
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(
                      item.quantity.toString(),
                    ),
                    IconButton(
                      onPressed: () => controller.incrementQuantity(item),
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
