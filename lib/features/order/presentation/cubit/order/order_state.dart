part of 'order_cubit.dart';

enum OrderStatus {
  initial,
  loading,
  success,
  error,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final String errorMessage;
  final List<OrderItemEntity> order;

  const OrderState({
    required this.status,
    required this.errorMessage,
    required this.order,
  });

  factory OrderState.initial() {
    return const OrderState(
      status: OrderStatus.initial,
      errorMessage: '',
      order: [],
    );
  }

  OrderState copyWith({
    required OrderStatus status,
    String? errorMessage,
    List<OrderItemEntity>? order,
  }) {
    return OrderState(
      status: status,
      errorMessage: errorMessage ?? this.errorMessage,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        order,
      ];
}
