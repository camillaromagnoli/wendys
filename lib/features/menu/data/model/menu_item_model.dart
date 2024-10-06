import 'package:json_annotation/json_annotation.dart';
import 'package:wendys/features/menu/domain/entities/menu_item_entity.dart';

part 'menu_item_model.g.dart';

@JsonSerializable()
class MenuItemModel extends MenuItemEntity {
  const MenuItemModel({
    required String name,
    required String description,
    required int menuItemId,
    required String? calorieRange,
    required String? priceRange,
  }) : super(
          name: name,
          description: description,
          menuItemId: menuItemId,
          calorieRange: calorieRange,
          priceRange: priceRange,
        );

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);
}
