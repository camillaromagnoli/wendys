import 'package:json_annotation/json_annotation.dart';
import 'package:wendys/features/menu/data/model/menu_item_model.dart';
import 'package:wendys/features/menu/data/model/sub_menu_model.dart';

part 'menu_lists_model.g.dart';

@JsonSerializable()
class MenuListsModel {
  MenuListsModel({
    required this.subMenus,
    required this.menuItems,
  });

  final List<SubMenuModel> subMenus;
  final List<MenuItemModel> menuItems;

  factory MenuListsModel.fromJson(Map<String, dynamic> json) =>
      _$MenuListsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuListsModelToJson(this);
}
