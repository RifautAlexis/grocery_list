import '../../models/grocery_overview.dart';
import '../providers/grocery_api_provider.dart';

class GroceriesOverviewRepository {
  const GroceriesOverviewRepository({
    required GroceryApiProvider groceriesApi,
  }) : _groceriesApi = groceriesApi;

  final GroceryApiProvider _groceriesApi;

  Future<List<GroceryOverview>> getGroceriesOverview() =>
      _groceriesApi.getGroceriesOverview();
}
