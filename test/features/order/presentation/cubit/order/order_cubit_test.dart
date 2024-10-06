import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/order/domain/usecases/delete_order_item_use_case.dart';
import 'package:wendys/features/order/domain/usecases/get_order_use_case.dart';
import 'package:wendys/features/order/presentation/cubit/order/order_cubit.dart';

import '../../../../../mocks/response_mocks.dart';
import '../../../../../mocks/use_cases_mocks.dart';

void main() {
  late GetOrderUseCase getOrderUseCase;
  late DeleteOrderItemUseCase deleteOrderItemUseCase;
  late OrderCubit orderCubit;

  setUp(() {
    getOrderUseCase = GetOrderUseCaseMock();
    deleteOrderItemUseCase = DeleteOrderItemUseCaseMock();

    orderCubit = OrderCubit(
      deleteOrderItemUseCase: deleteOrderItemUseCase,
      getOrderUseCase: getOrderUseCase,
    );
  });

  tearDown(() {
    orderCubit.close();
  });

  test('Initial state is OrderState.initial', () {
    expect(orderCubit.state, OrderState.initial());
  });

  group('Handle order tests', () {
    blocTest<OrderCubit, OrderState>(
      'Emits [OrderState.loading, OrderState.success] when getOrder is called successfully',
      build: () => orderCubit,
      act: (cubit) {
        when(() => getOrderUseCase.execute())
            .thenReturn(const Success([orderItemModel]));
        cubit.getOrder();
      },
      expect: () => [
        OrderState.initial().copyWith(
          status: OrderStatus.loading,
        ),
        OrderState.initial()
            .copyWith(status: OrderStatus.success, order: [orderItemModel]),
      ],
    );
    blocTest<OrderCubit, OrderState>(
      'Emits [OrderState.loading, OrderState.error] when getOrder fails',
      build: () => orderCubit,
      act: (cubit) {
        when(() => getOrderUseCase.execute()).thenReturn(Error(Failure('')));
        cubit.getOrder();
      },
      expect: () => [
        OrderState.initial().copyWith(
          status: OrderStatus.loading,
        ),
        OrderState.initial().copyWith(status: OrderStatus.error),
      ],
    );

    blocTest<OrderCubit, OrderState>(
      'Emits [OrderState.loading, OrderState.error] when deleteOrderItem is called successfully',
      build: () => orderCubit,
      act: (cubit) {
        when(() => deleteOrderItemUseCase.execute(any()))
            .thenAnswer((_) async => Error(Failure('')));
        cubit.deleteOrderItem(1);
      },
      expect: () => [
        OrderState.initial().copyWith(
          status: OrderStatus.loading,
        ),
        OrderState.initial().copyWith(status: OrderStatus.error),
      ],
    );
    blocTest<OrderCubit, OrderState>(
      'Emits [OrderState.loading, OrderState.error] when deleteOrderItem fails',
      build: () => orderCubit,
      act: (cubit) {
        when(() => deleteOrderItemUseCase.execute(any()))
            .thenAnswer((_) async => Error(Failure('')));
        cubit.deleteOrderItem(1);
      },
      expect: () => [
        OrderState.initial().copyWith(
          status: OrderStatus.loading,
        ),
        OrderState.initial().copyWith(status: OrderStatus.error),
      ],
    );
  });
}
