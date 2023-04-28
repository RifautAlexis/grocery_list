import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient extends HiveObject with _$Ingredient {
  Ingredient._();

  @HiveType(typeId: 1)
  factory Ingredient({
    @HiveField(0) required String name,
    @HiveField(1) required int quantity,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, Object?> json) =>
      _$IngredientFromJson(json);
}
