// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderItemEntityAdapter extends TypeAdapter<OrderItemEntity> {
  @override
  final int typeId = 0;

  @override
  OrderItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderItemEntity(
      name: fields[0] as String,
      menuItemId: fields[1] as int,
      priceRange: fields[2] as String?,
      quantity: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OrderItemEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.menuItemId)
      ..writeByte(2)
      ..write(obj.priceRange)
      ..writeByte(3)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
