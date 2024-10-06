import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wendys/features/menu/presentation/cubit/menu/menu_cubit.dart';
import 'package:wendys/features/menu/presentation/pages/menu_item_page.dart';

import '../../../../mocks/cubit_mock.dart';
import '../../../../mocks/response_mocks.dart';

void main() {
  late MenuCubit menuCubit;

  setUp(() {
    menuCubit = MenuCubitMock();
    registerFallbackValue(orderItemModel);
    registerFallbackValue(menuItemModel);
  });

  Widget createWidgetUnderTest({MenuState? state}) {
    final menuState = state ?? MenuState.initial();

    when(() => menuCubit.state).thenReturn(menuState);
    when(() => menuCubit.stream).thenAnswer((_) => Stream.value(menuState));

    when(() => menuCubit.saveOrderItem(any())).thenAnswer((_) async => {});

    return MaterialApp(
      home: BlocProvider<MenuCubit>.value(
        value: menuCubit,
        child: const MenuItemPage(
          menuItem: menuItemModel,
        ),
      ),
    );
  }

  testWidgets(
    'Add item to cart',
    (tester) async {
      final state = MenuState.initial().copyWith(status: MenuStatus.success);
      await tester.pumpWidget(createWidgetUnderTest(state: state));

      final button = find.byType(FloatingActionButton);

      expect(button, findsOneWidget);

      await tester.tap(button);

      await tester.pumpAndSettle();

      verify(() => menuCubit.saveOrderItem(any())).called(1);
    },
  );
}
