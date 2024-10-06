import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';
import 'package:wendys/features/order/domain/repositories/order_repository.dart';

abstract class GetOrderUseCase {
  Result<List<OrderItemEntity>, Failure> execute();
}

@Injectable(as: GetOrderUseCase)
class GetOrderUseCaseImpl extends GetOrderUseCase {
  GetOrderUseCaseImpl(this._repository);

  final OrderRepository _repository;

  @override
  Result<List<OrderItemEntity>, Failure> execute() {
    return _repository.getOrder();
  }
}
