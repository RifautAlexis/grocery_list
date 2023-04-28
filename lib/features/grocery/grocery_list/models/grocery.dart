import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'grocery.freezed.dart';
part 'grocery.g.dart';

@freezed
class Grocery extends HiveObject with _$Grocery {
  Grocery._();

  @Assert('name.isNotEmpty', 'name cannot be empty')
  @Assert('quantity >= 0', 'quantity has to be equals or superior to 0')
  @HiveType(typeId: 2)
  factory Grocery({
    @HiveField(0) required String name,
    @HiveField(1) required int quantity,
  }) = _Grocery;

  factory Grocery.fromJson(Map<String, Object?> json) =>
      _$GroceryFromJson(json);
}
