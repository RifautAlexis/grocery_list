import 'package:get/get.dart';
import '../../../../core/services/local_storage_service.dart';
import 'recipes_list_state.dart';

class RecipeListController extends StateController<RecipeListState> {
  RecipeListController();

  final LocalStorageService localStorageService = Get.find();
}
