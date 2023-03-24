import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/Widgets/custom_bottom_navigation_bar/presentation/controllers/custom_bottom_navigation_bar_controller.dart';
import '../../../../shared/Widgets/custom_bottom_navigation_bar/presentation/view/custom_bottom_navigation_bar.dart';
import '../controllers/recipes_list_controller.dart';

class RecipeListPage extends GetView<RecipeListController> {
  RecipeListPage({Key? key}) : super(key: key);

  final CustomBottomNavigationBarController navigationControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Center(
        child: Text(navigationControler.bottomNavigationBarIndex.toString()),
      ),
    );
  }
}
