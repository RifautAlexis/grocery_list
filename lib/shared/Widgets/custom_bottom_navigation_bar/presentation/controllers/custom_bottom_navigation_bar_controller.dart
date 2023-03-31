import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';

class CustomBottomNavigationBarController extends GetxController {
  int bottomNavigationBarIndex = 0;

  void navigate(int index) {
    bottomNavigationBarIndex = index;

    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        Get.toNamed(Routes.RECIPES);
        break;
      default:
        Get.toNamed(Routes.HOME);
    }
  }
}
