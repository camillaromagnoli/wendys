import 'package:equatable/equatable.dart';

class MenuItemEntity extends Equatable {
  final String name;
  final String? description;
  final int menuItemId;
  final String? calorieRange;
  final String? priceRange;

  const MenuItemEntity({
    required this.name,
    this.description,
    required this.menuItemId,
    this.calorieRange,
    this.priceRange,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        menuItemId,
        calorieRange,
        priceRange,
      ];
}
