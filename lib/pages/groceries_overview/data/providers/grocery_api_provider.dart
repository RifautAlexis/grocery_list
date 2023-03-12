import 'package:grocery_list/pages/groceries_overview/models/grocery_overview.dart';

class GroceryApiProvider {
  const GroceryApiProvider();

  Future<List<GroceryOverview>> getGroceriesOverview() {
    return Future.sync(() => [
          GroceryOverview(productName: "Carrot", quantity: 1),
          GroceryOverview(productName: "Celery", quantity: 5),
          GroceryOverview(productName: "Mushrooms", quantity: 1),
          GroceryOverview(productName: "Spinach", quantity: 1),
          GroceryOverview(productName: "Onion", quantity: 1),
          GroceryOverview(productName: "Garlic", quantity: 1),
          GroceryOverview(productName: "Pepper", quantity: 3),
          GroceryOverview(productName: "Cucumber", quantity: 1),
          GroceryOverview(productName: "Lentils", quantity: 1),
          GroceryOverview(productName: "Lettuce", quantity: 1),
          GroceryOverview(productName: "Tomato", quantity: 6),
          GroceryOverview(productName: "Brussels sprouts", quantity: 1),
          GroceryOverview(productName: "Broccoli", quantity: 1),
          GroceryOverview(productName: "Butter", quantity: 1),
          GroceryOverview(productName: "Milk", quantity: 9),
          GroceryOverview(productName: "Rice", quantity: 5),
          GroceryOverview(productName: "Sugar", quantity: 4),
          GroceryOverview(productName: "Mango", quantity: 1),
          GroceryOverview(productName: "Peach", quantity: 1),
          GroceryOverview(productName: "Parmesan", quantity: 3),
          GroceryOverview(productName: "Almond Milk", quantity: 9),
        ]);
  }
}
