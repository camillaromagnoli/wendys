import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/features/order/domain/repositories/order_repository.dart';

abstract class DeleteOrderItemUseCase {
  Future<Result<void, Exception>> execute(int menuItemId);
}

@Injectable(as: DeleteOrderItemUseCase)
class DeleteOrderItemUseCaseImpl extends DeleteOrderItemUseCase {
  DeleteOrderItemUseCaseImpl(this._repository);

  final OrderRepository _repository;

  @override
  Future<Result<void, Exception>> execute(int menuItemId) async {
    return await _repository.deleteOrderItem(menuItemId);
  }
}
