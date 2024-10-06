import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';
import 'package:wendys/features/order/domain/usecases/delete_order_item_use_case.dart';
import 'package:wendys/features/order/domain/usecases/get_order_use_case.dart';

part 'order_state.dart';

@Injectable()
class OrderCubit extends Cubit<OrderState> {
  final GetOrderUseCase _getOrderUseCase;
  final DeleteOrderItemUseCase _deleteOrderItemUseCase;

  OrderCubit({
    required GetOrderUseCase getOrderUseCase,
    required DeleteOrderItemUseCase deleteOrderItemUseCase,
  })  : _getOrderUseCase = getOrderUseCase,
        _deleteOrderItemUseCase = deleteOrderItemUseCase,
        super(OrderState.initial());

  Future<void> getOrder() async {
    emit(state.copyWith(status: OrderStatus.loading));
    final result = _getOrderUseCase.execute();
    result.when(
      (success) {
        emit(state.copyWith(status: OrderStatus.success, order: success));
      },
      (error) {
        emit(state.copyWith(status: OrderStatus.error));
      },
    );
  }

  Future<void> deleteOrderItem(int menuItemId) async {
    emit(state.copyWith(status: OrderStatus.loading));
    final result = await _deleteOrderItemUseCase.execute(menuItemId);

    result.when(
      (success) {
        getOrder();
        emit(state.copyWith(status: OrderStatus.success));
      },
      (error) {
        emit(state.copyWith(status: OrderStatus.error));
      },
    );
  }
}
