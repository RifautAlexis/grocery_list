import 'package:get/get.dart';

import '../pages/groceries_overview/bindings/groceries_overview_binding.dart';
import '../pages/groceries_overview/presentation/view/groceries_overview_page.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const GroceriesOverviewPage(),
      binding: GroceriesOverviewBinding(),
    ),
  ];
}
