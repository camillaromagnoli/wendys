import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/order/data/repositories/order_repository_impl.dart';
import 'package:wendys/features/order/data/services/order_service.dart';
import 'package:wendys/features/order/domain/repositories/order_repository.dart';

import '../../../../mocks/response_mocks.dart';
import '../../../../mocks/services_mock.dart';

void main() {
  late OrderService orderServiceMock;
  late OrderRepository orderRepository;

  setUp(() async {
    orderServiceMock = OrderServiceMock();
    orderRepository = OrderRepositoryImpl(orderServiceMock);
  });
  group('Handle local data tests', () {
    test('Should return the order when the response is a success', () async {
      when(() => orderServiceMock.getOrder()).thenReturn([orderItemModel]);

      final result = orderRepository.getOrder();

      expect(result, isA<Success>());

      expect(result.tryGetSuccess(), equals([orderItemModel]));
    });

    test('Should throw a ServerException when the getOrder request fails',
        () async {
      when(() => orderServiceMock.getOrder()).thenThrow(ServerException(''));

      final result = orderRepository.getOrder();

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<ServerException>());
    });

    test('Should save an item in the order when the response is a success',
        () async {
      when(() => orderServiceMock.saveOrderItem(orderItemModel))
          .thenAnswer((_) async => const Success({}));

      final result = await orderRepository.saveOrderItem(orderItemModel);

      expect(result, isA<Success>());
    });

    test('Should throw a ServerException when the saveOrderItem request fails',
        () async {
      when(() => orderServiceMock.saveOrderItem(orderItemModel))
          .thenThrow(ServerException(''));

      final result = await orderRepository.saveOrderItem(orderItemModel);

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<ServerException>());
    });

    test('Should delete an item int the order when the response is a success',
        () async {
      when(() => orderServiceMock.deleteOrderItem(1))
          .thenAnswer((_) async => const Success({}));

      final result = await orderRepository.deleteOrderItem(1);

      expect(result, isA<Success>());
    });

    test('Should throw a ServerException when the saveOrderItem request fails',
        () async {
      when(() => orderServiceMock.deleteOrderItem(1))
          .thenThrow(ServerException(''));

      final result = await orderRepository.deleteOrderItem(1);

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<ServerException>());
    });
  });
}
