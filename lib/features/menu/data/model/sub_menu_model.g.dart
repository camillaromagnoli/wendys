// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubMenuModel _$SubMenuModelFromJson(Map<String, dynamic> json) => SubMenuModel(
      name: json['name'] as String,
      baseImageName: json['baseImageName'] as String,
      menuItems: (json['menuItems'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SubMenuModelToJson(SubMenuModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'baseImageName': instance.baseImageName,
      'menuItems': instance.menuItems,
    };
