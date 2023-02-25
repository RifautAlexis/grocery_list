import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/groceries_overview/data/repository/groceries_overview_repository.dart';
import 'package:grocery_list/groceries_overview/view/groceries_overview_page.dart';

import 'global_bloc_observer.dart';
import 'groceries_overview/data/providers/grocery_api_provider.dart';

void main() {
  Bloc.observer = GlobalBlocObserver();

  const groceryApiProvider = GroceryApiProvider();
  const groceriesOverviewRepository =
      GroceriesOverviewRepository(groceriesApi: groceryApiProvider);

  runApp(const App(groceriesOverviewRepository: groceriesOverviewRepository));
}

class App extends StatelessWidget {
  const App({super.key, required this.groceriesOverviewRepository});

  final GroceriesOverviewRepository groceriesOverviewRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: groceriesOverviewRepository,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const GroceriesOverviewPage(),
      ),
    );
  }
}
