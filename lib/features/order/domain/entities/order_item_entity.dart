import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'order_item_entity.g.dart';

@HiveType(typeId: 0)
class OrderItemEntity extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int menuItemId;
  @HiveField(2)
  final String? priceRange;
  @HiveField(3)
  final int quantity;

  const OrderItemEntity({
    required this.name,
    required this.menuItemId,
    required this.priceRange,
    required this.quantity,
  });

  OrderItemEntity copyWith({
    String? name,
    int? menuItemId,
    String? priceRange,
    int? quantity,
  }) {
    return OrderItemEntity(
      name: name ?? this.name,
      menuItemId: menuItemId ?? this.menuItemId,
      priceRange: priceRange ?? this.priceRange,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
        name,
        menuItemId,
        priceRange,
        quantity,
      ];
}
