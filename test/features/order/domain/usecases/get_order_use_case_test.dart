import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/order/domain/repositories/order_repository.dart';
import 'package:wendys/features/order/domain/usecases/get_order_use_case.dart';

import '../../../../mocks/repositories_mock.dart';
import '../../../../mocks/response_mocks.dart';

void main() {
  late OrderRepository orderRepository;
  late GetOrderUseCase getOrderUseCase;

  setUp(() async {
    orderRepository = OrderRepositoryMock();
    getOrderUseCase = GetOrderUseCaseImpl(orderRepository);
  });

  registerFallbackValue(orderItemModel);

  test('Should delete an item when the response is a success', () async {
    when(() => orderRepository.getOrder())
        .thenReturn(const Success([orderItemModel]));

    final result = getOrderUseCase.execute();

    expect(result, isA<Success>());

    expect(result.tryGetSuccess(), [orderItemModel]);
  });

  test('Should throw a Failure when the response is an error ', () async {
    when(() => orderRepository.getOrder()).thenReturn(Error(Failure('')));

    final result = getOrderUseCase.execute();

    expect(result.isError(), true);

    expect(result.tryGetError(), isA<Failure>());
  });
}
