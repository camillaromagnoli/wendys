part of 'sub_menu_cubit.dart';

enum SubMenuStatus {
  initial,
  loading,
  success,
  error,
}

class SubMenuState extends Equatable {
  final SubMenuStatus status;
  final String errorMessage;
  final List<SubMenuEntity> subMenus;
  final List<OrderItemEntity> order;

  const SubMenuState({
    required this.status,
    required this.errorMessage,
    required this.subMenus,
    required this.order,
  });

  factory SubMenuState.initial() {
    return const SubMenuState(
      status: SubMenuStatus.initial,
      errorMessage: '',
      subMenus: [],
      order: [],
    );
  }

  SubMenuState copyWith({
    required SubMenuStatus status,
    String? errorMessage,
    List<SubMenuEntity>? subMenus,
    List<OrderItemEntity>? order,
  }) {
    return SubMenuState(
      status: status,
      errorMessage: errorMessage ?? this.errorMessage,
      subMenus: subMenus ?? this.subMenus,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        subMenus,
        order,
      ];
}
