import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'grocery_overview.freezed.dart';
part 'grocery_overview.g.dart';

@freezed
class GroceryOverview with _$GroceryOverview {
  @Assert('productName.isNotEmpty', 'productName cannot be empty')
  @Assert('quantity >= 0', 'quantity has to be equals or superior to 0')
  factory GroceryOverview({
    required String productName,
    required int quantity,
  }) = _GroceryOverview;

  factory GroceryOverview.fromJson(Map<String, Object?> json) =>
      _$GroceryOverviewFromJson(json);
}
