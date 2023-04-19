import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_list/routes/app_pages.dart';
import '../../../../shared/Widgets/custom_bottom_navigation_bar/presentation/controllers/custom_bottom_navigation_bar_controller.dart';
import '../../../../shared/Widgets/custom_bottom_navigation_bar/presentation/view/custom_bottom_navigation_bar.dart';
import '../../../../shared/Widgets/input_add_grocery/presentation/view/input_add_grocery_page.dart';
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
        title: const InputAddGrocery(),
        actions: [
          IconButton(
              onPressed: () => controller.openRecipeImporter(),
              icon: Icon(Icons.download))
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
      Container(
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
                    onPressed: () => print('DELETED'),
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () => controller.shareRecipe(item.name),
                    icon: const Icon(Icons.share),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
