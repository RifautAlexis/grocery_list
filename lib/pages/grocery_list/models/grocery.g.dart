// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroceryAdapter extends TypeAdapter<_$_Grocery> {
  @override
  final int typeId = 2;

  @override
  _$_Grocery read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Grocery(
      name: fields[0] as String,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Grocery obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Grocery _$$_GroceryFromJson(Map<String, dynamic> json) => _$_Grocery(
      name: json['name'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$_GroceryToJson(_$_Grocery instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
    };
