import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final List<String> steps;
  @HiveField(2)
  final List<Ingredient> ingrdients;
  @HiveField(3)
  final List<String> tags;

  Recipe(this.name, this.steps, this.ingrdients, this.tags);
}

@HiveType(typeId: 1)
class Ingredient extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int quantity;

  Ingredient(this.name, this.quantity);
}

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      fields[0] as String,
      fields[1] as List<String>,
      fields[2] as List<Ingredient>,
      fields[3] as List<String>,
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer.write(obj.name);
    writer.write(obj.name);
    for (var step in obj.steps) {
      writer.write(step);
    }
    for (var ingredient in obj.ingrdients) {
      writer.write(ingredient.name);
      writer.writeInt(ingredient.quantity);
    }
    for (var tag in obj.tags) {
      writer.write(tag);
    }
  }
}

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final typeId = 1;

  @override
  Ingredient read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredient(fields[0] as String, fields[1] as int);
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer.write(obj.name);
    writer.writeInt(obj.quantity);
  }
}
