import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wendys/core/design/widgets/dialog_widget.dart';
import 'package:wendys/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:wendys/features/order/presentation/pages/order_page.dart';

import '../../../../mocks/cubit_mock.dart';
import '../../../../mocks/response_mocks.dart';

void main() {
  late OrderCubit orderCubit;

  setUp(() {
    orderCubit = OrderCubitMock();
  });

  Widget createWidgetUnderTest({OrderState? state}) {
    final orderState = state ?? OrderState.initial();

    when(() => orderCubit.state).thenReturn(orderState);
    when(() => orderCubit.stream).thenAnswer((_) => Stream.value(orderState));

    when(() => orderCubit.getOrder()).thenAnswer((_) async => {});
    when(() => orderCubit.deleteOrderItem(any())).thenAnswer((_) async => {});

    return MaterialApp(
      home: BlocProvider<OrderCubit>.value(
        value: orderCubit,
        child: const OrderPage(),
      ),
    );
  }

  testWidgets(
    'Should tap on delete item from order',
    (tester) async {
      final state = OrderState.initial()
          .copyWith(status: OrderStatus.success, order: [orderItemModel]);
      await tester.pumpWidget(createWidgetUnderTest(state: state));

      await tester.pump();

      final button = find.byIcon(Icons.delete_outline);

      await tester.tap(button);

      verify(() => orderCubit.deleteOrderItem(any())).called(1);
    },
  );

  testWidgets(
    'Should show error dialog',
    (tester) async {
      final state = OrderState.initial().copyWith(
        status: OrderStatus.error,
      );
      await tester.pumpWidget(createWidgetUnderTest(state: state));

      await tester.pump();

      expect(find.byType(WendysDialog), findsOneWidget);
    },
  );
}
