import 'package:grocery_list/groceries_overview/models/grocery_overview.dart';

class GroceryApiProvider {
  const GroceryApiProvider();

  Future<List<GroceryOverview>> getGroceriesOverview() {
    return Future.sync(() => [
          const GroceryOverview(productName: "Carrot"),
          const GroceryOverview(productName: "Celery"),
          const GroceryOverview(productName: "Mushrooms"),
          const GroceryOverview(productName: "Spinach"),
          const GroceryOverview(productName: "Onion"),
          const GroceryOverview(productName: "Garlic"),
          const GroceryOverview(productName: "Pepper"),
          const GroceryOverview(productName: "Cucumber"),
          const GroceryOverview(productName: "Lentils"),
          const GroceryOverview(productName: "Lettuce"),
          const GroceryOverview(productName: "Tomato"),
          const GroceryOverview(productName: "Brissels sprouts"),
          const GroceryOverview(productName: "Broccoli"),
          const GroceryOverview(productName: "Butter"),
          const GroceryOverview(productName: "Milk"),
          const GroceryOverview(productName: "Rice"),
          const GroceryOverview(productName: "Sugar"),
          const GroceryOverview(productName: "Mango"),
          const GroceryOverview(productName: "Peach"),
          const GroceryOverview(productName: "Parmesan"),
          const GroceryOverview(productName: "Almond Milk"),
        ]);
  }
}
