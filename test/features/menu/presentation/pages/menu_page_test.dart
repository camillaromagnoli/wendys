import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wendys/core/design/widgets/circular_progress_indicator_widget.dart';
import 'package:wendys/core/design/widgets/dialog_widget.dart';
import 'package:wendys/features/menu/presentation/cubit/menu/menu_cubit.dart';
import 'package:wendys/features/menu/presentation/pages/menu_page.dart';

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

    when(() => menuCubit.getMenuItems(any())).thenAnswer((_) async => {});

    return MaterialApp(
      home: BlocProvider<MenuCubit>.value(
        value: menuCubit,
        child: MenuPage(
          subMenuModel: subMenuModel,
        ),
      ),
    );
  }

  testWidgets(
    'Should render WendysCircularProgressIndicator when the status is loading',
    (tester) async {
      final state = MenuState.initial().copyWith(status: MenuStatus.loading);
      await tester.pumpWidget(createWidgetUnderTest(state: state));

      await tester.pump();

      expect(find.byType(WendysCircularProgressIndicator), findsOneWidget);
    },
  );
  testWidgets(
    'Show error dialog',
    (tester) async {
      final state = MenuState.initial().copyWith(
        status: MenuStatus.error,
      );
      await tester.pumpWidget(createWidgetUnderTest(state: state));

      await tester.pump();

      expect(find.byType(WendysDialog), findsOneWidget);
    },
  );
  testWidgets(
    'Should render page with success',
    (tester) async {
      final state = MenuState.initial().copyWith(status: MenuStatus.success);
      await tester.pumpWidget(createWidgetUnderTest(state: state));

      verify(() => menuCubit.getMenuItems(any())).called(1);
    },
  );
}
