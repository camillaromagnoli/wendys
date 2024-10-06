import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/order/data/services/order_service.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';
import 'package:wendys/features/order/domain/repositories/order_repository.dart';

@Injectable(as: OrderRepository)
class OrderRepositoryImpl extends OrderRepository {
  OrderRepositoryImpl(this._orderService);

  final OrderService _orderService;

  @override
  Future<Result<void, Failure>> deleteOrderItem(int menuItemId) async {
    try {
      return Success(_orderService.deleteOrderItem(menuItemId));
    } on Exception catch (e) {
      return Error(
          ServerException("Server returned an error: ${e.toString()}"));
    }
  }

  @override
  Result<List<OrderItemEntity>, Failure> getOrder() {
    try {
      return Success(_orderService.getOrder());
    } on Exception catch (e) {
      return Error(
          ServerException("Server returned an error: ${e.toString()}"));
    }
  }

  @override
  Future<Result<void, Failure>> saveOrderItem(OrderItemEntity order) async {
    try {
      return Success(_orderService.saveOrderItem(order));
    } on Exception catch (e) {
      return Error(
          ServerException("Server returned an error: ${e.toString()}"));
    }
  }
}
