part of 'menu_cubit.dart';

enum MenuStatus {
  initial,
  loading,
  success,
  error,
}

class MenuState extends Equatable {
  final MenuStatus status;
  final String errorMessage;
  final List<MenuItemEntity> menuItems;

  const MenuState({
    required this.status,
    required this.errorMessage,
    required this.menuItems,
  });

  factory MenuState.initial() {
    return const MenuState(
      status: MenuStatus.initial,
      errorMessage: '',
      menuItems: [],
    );
  }

  MenuState copyWith({
    required MenuStatus status,
    String? errorMessage,
    List<MenuItemEntity>? menuItems,
  }) {
    return MenuState(
      status: status,
      errorMessage: errorMessage ?? this.errorMessage,
      menuItems: menuItems ?? this.menuItems,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        menuItems,
        order,
      ];
}
