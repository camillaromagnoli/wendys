// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      name: json['name'] as String,
      menuItemId: (json['menuItemId'] as num).toInt(),
      priceRange: json['priceRange'] as String?,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'menuItemId': instance.menuItemId,
      'priceRange': instance.priceRange,
      'quantity': instance.quantity,
    };
