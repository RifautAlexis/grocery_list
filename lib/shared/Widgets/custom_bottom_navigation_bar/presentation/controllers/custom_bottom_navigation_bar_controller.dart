import 'package:get/get.dart';

class CustomBottomNavigationBarController extends GetxController {
  int bottomNavigationBarIndex = 0;

  void navigate(int index) {
    bottomNavigationBarIndex = index;

    switch (index) {
      case 0:
        Get.toNamed('/groceryList');
        break;
      case 1:
        Get.toNamed('/recipeList');
        break;
      default:
        Get.toNamed('/groceryList');
    }
  }
}
