import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/groceries_overview/bloc/groceries_overview_bloc.dart';
import '../bloc/groceries_overview_event.dart';
import '../models/grocery_overview.dart';

class GroceriesOverviewItem extends StatelessWidget {
  const GroceriesOverviewItem({
    super.key,
    required this.item,
    required this.animation,
  });

  final GroceryOverview item;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context
              .read<GroceriesOverviewBloc>()
              .add(const GroceriesOverviewItemAdded()),
          child: SizedBox(
            height: 80.0,
            child: Card(
              child: Center(
                child: Text(item.productName),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
