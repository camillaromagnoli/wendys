import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wendys/core/design/widgets/circular_progress_indicator_widget.dart';
import 'package:wendys/core/design/widgets/dialog_widget.dart';
import 'package:wendys/core/design/widgets/wendys_card.dart';
import 'package:wendys/features/menu/presentation/cubit/sub_menu/sub_menu_cubit.dart';
import 'package:wendys/features/menu/presentation/pages/categories_page.dart';

import '../../../../mocks/cubit_mock.dart';
import '../../../../mocks/response_mocks.dart';

void main() {
  late SubMenuCubit subMenuCubitMock;

  setUp(() {
    subMenuCubitMock = SubMenuCubitMock();
  });

  Widget createWidgetUnderTest({SubMenuState? state}) {
    final subMenuState = state ?? SubMenuState.initial();

    when(() => subMenuCubitMock.state).thenReturn(subMenuState);
    when(() => subMenuCubitMock.stream)
        .thenAnswer((_) => Stream.value(subMenuState));

    when(() => subMenuCubitMock.getSubMenus()).thenAnswer((_) async => {});
    when(() => subMenuCubitMock.getOrder()).thenAnswer((_) async => {});

    return MaterialApp(
      home: BlocProvider<SubMenuCubit>.value(
        value: subMenuCubitMock,
        child: const CategoriesPage(),
      ),
    );
  }

  testWidgets(
    'Should render WendysCircularProgressIndicator when the status is loading',
    (tester) async {
      final state =
          SubMenuState.initial().copyWith(status: SubMenuStatus.loading);
      await tester.pumpWidget(createWidgetUnderTest(state: state));

      await tester.pump();

      expect(find.byType(WendysCircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'Should render WendysCard list when the status is success',
    (tester) async {
      final state = SubMenuState.initial()
          .copyWith(status: SubMenuStatus.success, subMenus: [subMenuModel]);
      await tester.pumpWidget(createWidgetUnderTest(state: state));

      await tester.pump();

      expect(find.byType(WendysCard), findsNWidgets(state.subMenus.length));
    },
  );

  testWidgets(
    'Should show error dialog',
    (tester) async {
      final state = SubMenuState.initial().copyWith(
        status: SubMenuStatus.error,
      );
      await tester.pumpWidget(createWidgetUnderTest(state: state));

      await tester.pump();

      expect(find.byType(WendysDialog), findsOneWidget);
    },
  );
}
