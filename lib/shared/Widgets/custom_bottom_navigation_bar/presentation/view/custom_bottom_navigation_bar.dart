import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/custom_bottom_navigation_bar_controller.dart';

class CustomBottomNavigationBar
    extends GetView<CustomBottomNavigationBarController> {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.bottomNavigationBarIndex,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Recipes',
          icon: Icon(Icons.menu_book),
        ),
      ],
      onTap: (int newIndex) => controller.navigate(newIndex),
    );
  }
}
