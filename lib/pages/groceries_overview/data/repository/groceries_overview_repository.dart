import '../../models/grocery_overview.dart';
import '../providers/grocery_api_provider.dart';

class GroceriesOverviewRepository {
  GroceriesOverviewRepository({required this.groceriesApi});

  final GroceryApiProvider groceriesApi;

  Future<List<GroceryOverview>> getGroceriesOverview() =>
      groceriesApi.getGroceriesOverview();
}
