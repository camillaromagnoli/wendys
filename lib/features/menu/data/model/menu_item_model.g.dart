// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) =>
    MenuItemModel(
      name: json['name'] as String,
      description: json['description'] as String,
      menuItemId: (json['menuItemId'] as num).toInt(),
      calorieRange: json['calorieRange'] as String?,
      priceRange: json['priceRange'] as String?,
    );

Map<String, dynamic> _$MenuItemModelToJson(MenuItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'menuItemId': instance.menuItemId,
      'calorieRange': instance.calorieRange,
      'priceRange': instance.priceRange,
    };
