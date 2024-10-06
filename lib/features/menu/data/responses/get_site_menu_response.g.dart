// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_site_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSiteMenuResponse _$GetSiteMenuResponseFromJson(Map<String, dynamic> json) =>
    GetSiteMenuResponse(
      menuLists:
          MenuListsModel.fromJson(json['menuLists'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSiteMenuResponseToJson(
        GetSiteMenuResponse instance) =>
    <String, dynamic>{
      'menuLists': instance.menuLists,
    };
