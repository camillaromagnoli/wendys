import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/order/domain/repositories/order_repository.dart';
import 'package:wendys/features/order/domain/usecases/delete_order_item_use_case.dart';

import '../../../../mocks/repositories_mock.dart';

void main() {
  late OrderRepository orderRepository;
  late DeleteOrderItemUseCase deleteOrderItemUseCase;

  setUp(() async {
    orderRepository = OrderRepositoryMock();
    deleteOrderItemUseCase = DeleteOrderItemUseCaseImpl(orderRepository);
  });

  test('Should delete an item when the response is a success', () async {
    when(() => orderRepository.deleteOrderItem(any()))
        .thenAnswer((_) async => const Success({}));

    final result = await deleteOrderItemUseCase.execute(1);

    expect(result, isA<Success>());
  });

  test('Should throw a Failure when the response is an error ', () async {
    when(() => orderRepository.deleteOrderItem(any()))
        .thenAnswer((_) async => Error(Failure('')));

    final result = await deleteOrderItemUseCase.execute(1);

    expect(result.isError(), true);

    expect(result.tryGetError(), isA<Failure>());
  });
}
