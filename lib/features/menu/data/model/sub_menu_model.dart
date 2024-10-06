import 'package:json_annotation/json_annotation.dart';
import 'package:wendys/features/menu/domain/entities/sub_menu_entity.dart';

part 'sub_menu_model.g.dart';

@JsonSerializable()
class SubMenuModel extends SubMenuEntity {
  SubMenuModel({
    required String name,
    required String baseImageName,
    required List<int> menuItems,
  }) : super(
          name: name,
          baseImageName: baseImageName,
          menuItems: menuItems,
        );

  factory SubMenuModel.fromJson(Map<String, dynamic> json) =>
      _$SubMenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubMenuModelToJson(this);
}
