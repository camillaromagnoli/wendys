// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_lists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuListsModel _$MenuListsModelFromJson(Map<String, dynamic> json) =>
    MenuListsModel(
      subMenus: (json['subMenus'] as List<dynamic>)
          .map((e) => SubMenuModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      menuItems: (json['menuItems'] as List<dynamic>)
          .map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuListsModelToJson(MenuListsModel instance) =>
    <String, dynamic>{
      'subMenus': instance.subMenus,
      'menuItems': instance.menuItems,
    };
