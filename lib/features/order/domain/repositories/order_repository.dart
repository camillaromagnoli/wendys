import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';

abstract class OrderRepository {
  Result<List<OrderItemEntity>, Failure> getOrder();
  Future<Result<void, Failure>> saveOrderItem(OrderItemEntity order);
  Future<Result<void, Failure>> deleteOrderItem(int menuItemId);
}
