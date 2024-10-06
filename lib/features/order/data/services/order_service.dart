import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';

abstract class OrderService {
  Future<void> saveOrderItem(OrderItemEntity order);
  List<OrderItemEntity> getOrder();
  Future<void> deleteOrderItem(int menuItemId);
}

@Injectable(as: OrderService)
class OrderServiceImpl implements OrderService {
  OrderServiceImpl();

  final Box<OrderItemEntity> _orderHiveBox =
      Hive.box<OrderItemEntity>('orderBox');

  @override
  Future<void> deleteOrderItem(int menuItemId) async {
    try {
      await _orderHiveBox.delete(menuItemId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<OrderItemEntity> getOrder() {
    try {
      return _orderHiveBox.values.toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveOrderItem(OrderItemEntity order) async {
    try {
      final orderItem = _orderHiveBox.get(order.menuItemId);
      if (orderItem != null) {
        _orderHiveBox.put(
          order.menuItemId,
          order.copyWith(
            quantity: orderItem.quantity + order.quantity,
          ),
        );
      } else {
        await _orderHiveBox.put(
          order.menuItemId,
          order,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
