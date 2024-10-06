import 'package:equatable/equatable.dart';

abstract class SubMenuEntity extends Equatable {
  final String name;
  final String baseImageName;
  final List<int> menuItems;

  const SubMenuEntity({
    required this.name,
    required this.baseImageName,
    required this.menuItems,
  });

  @override
  List<Object?> get props => [name, baseImageName, menuItems];
}
