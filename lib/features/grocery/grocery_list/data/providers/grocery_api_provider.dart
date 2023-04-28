import 'package:grocery_list/features/grocery/grocery_list/models/grocery.dart';

class GroceryApiProvider {
  const GroceryApiProvider();

  Future<List<Grocery>> getGroceries() {
    return Future.sync(() => [
          Grocery(name: "Carrot", quantity: 1),
          Grocery(name: "Celery", quantity: 5),
          Grocery(name: "Mushrooms", quantity: 1),
          Grocery(name: "Spinach", quantity: 1),
          Grocery(name: "Onion", quantity: 1),
          Grocery(name: "Garlic", quantity: 1),
          Grocery(name: "Pepper", quantity: 3),
          Grocery(name: "Cucumber", quantity: 1),
          Grocery(name: "Lentils", quantity: 1),
          Grocery(name: "Lettuce", quantity: 1),
          Grocery(name: "Tomato", quantity: 6),
          Grocery(name: "Brussels sprouts", quantity: 1),
          Grocery(name: "Broccoli", quantity: 1),
          Grocery(name: "Butter", quantity: 1),
          Grocery(name: "Milk", quantity: 9),
          Grocery(name: "Rice", quantity: 5),
          Grocery(name: "Sugar", quantity: 4),
          Grocery(name: "Mango", quantity: 1),
          Grocery(name: "Peach", quantity: 1),
          Grocery(name: "Parmesan", quantity: 3),
          Grocery(name: "Almond Milk", quantity: 9),
        ]);
  }
}
