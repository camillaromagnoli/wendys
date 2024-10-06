import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/order/domain/repositories/order_repository.dart';
import 'package:wendys/features/order/domain/usecases/save_order_item_use_case.dart';

import '../../../../mocks/repositories_mock.dart';
import '../../../../mocks/response_mocks.dart';

void main() {
  late OrderRepository orderRepository;
  late SaveOrderItemUseCase saveOrderItemUseCase;

  setUp(() async {
    orderRepository = OrderRepositoryMock();
    saveOrderItemUseCase = SaveOrderItemUseCaseImpl(orderRepository);
  });

  registerFallbackValue(orderItemModel);

  test('Should delete an item when the response is a success', () async {
    when(() => orderRepository.saveOrderItem(any()))
        .thenAnswer((_) async => const Success({}));

    final result = await saveOrderItemUseCase.execute(orderItemModel);

    expect(result, isA<Success>());
  });

  test('Should throw a Failure when the response is an error ', () async {
    when(() => orderRepository.saveOrderItem(any()))
        .thenAnswer((_) async => Error(Failure('')));

    final result = await saveOrderItemUseCase.execute(orderItemModel);

    expect(result.isError(), true);

    expect(result.tryGetError(), isA<Failure>());
  });
}
