import 'package:json_annotation/json_annotation.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';

part 'order_item_model.g.dart';

@JsonSerializable()
class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required String name,
    required int menuItemId,
    required String? priceRange,
    required int quantity,
  }) : super(
          name: name,
          menuItemId: menuItemId,
          priceRange: priceRange,
          quantity: quantity,
        );

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);
}
