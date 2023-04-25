import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/Widgets/custom_bottom_navigation_bar/presentation/controllers/custom_bottom_navigation_bar_controller.dart';
import '../../../../shared/Widgets/custom_bottom_navigation_bar/presentation/view/custom_bottom_navigation_bar.dart';
import '../../models/recipe_overview.dart';
import '../controllers/recipes_list_controller.dart';

class RecipeListPage extends GetView<RecipeListController> {
  RecipeListPage({Key? key}) : super(key: key);

  final CustomBottomNavigationBarController navigationControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addRecipe();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Add A Search Bar Here"),
        actions: [
          IconButton(
              onPressed: () => controller.openRecipeImporter(),
              icon: const Icon(Icons.download))
        ],
        centerTitle: true,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state!.recipes.length,
          itemBuilder: (
            context,
            index,
          ) =>
              buildItem(state.recipes[index], index, 60.0),
        ),
        onError: (error) => const Text("An error has occured, please refresh"),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Center(
          child: Text("No recipes in the cookbook"),
        ),
      ),
    );
  }

  Widget buildItem(
    RecipeOverview item,
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
        onDismissed: (direction) => controller.removeItem(item.id),
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
                      onPressed: () => controller.addIngredients(item.id),
                      icon: const Icon(Icons.shopping_basket),
                    ),
                    IconButton(
                      onPressed: () => controller.shareRecipe(item.id),
                      icon: const Icon(Icons.share),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
