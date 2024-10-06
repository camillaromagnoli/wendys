import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';
import 'package:wendys/features/order/domain/repositories/order_repository.dart';

abstract class SaveOrderItemUseCase {
  Future<Result<void, Failure>> execute(OrderItemEntity order);
}

@Injectable(as: SaveOrderItemUseCase)
class SaveOrderItemUseCaseImpl extends SaveOrderItemUseCase {
  SaveOrderItemUseCaseImpl(this._repository);

  final OrderRepository _repository;

  @override
  Future<Result<void, Failure>> execute(OrderItemEntity order) async {
    return _repository.saveOrderItem(order);
  }
}
