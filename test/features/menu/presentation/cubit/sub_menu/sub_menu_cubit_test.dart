import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/menu/domain/usecases/get_sub_menus_use_case.dart';
import 'package:wendys/features/menu/presentation/cubit/sub_menu/sub_menu_cubit.dart';
import 'package:wendys/features/order/domain/usecases/get_order_use_case.dart';

import '../../../../../mocks/response_mocks.dart';
import '../../../../../mocks/use_cases_mocks.dart';

void main() {
  late GetSubMenusUseCase getSubMenusUseCaseMock;
  late GetOrderUseCase getOrderUseCaseMock;
  late SubMenuCubit subMenuCubit;

  setUp(() {
    getSubMenusUseCaseMock = GetSubMenusUseCaseMock();
    getOrderUseCaseMock = GetOrderUseCaseMock();

    subMenuCubit = SubMenuCubit(
      getSubMenusUseCase: getSubMenusUseCaseMock,
      getOrderUseCase: getOrderUseCaseMock,
    );
  });

  tearDown(() {
    subMenuCubit.close();
  });

  test('Initial state is MenuInitial', () {
    expect(subMenuCubit.state, SubMenuState.initial());
  });

  group('Get SubMenus tests', () {
    blocTest<SubMenuCubit, SubMenuState>(
      'Emits [SubMenuState.loading, SubMenuState.success] when getSubMenus is called successfully',
      build: () => subMenuCubit,
      act: (cubit) {
        when(() => getSubMenusUseCaseMock.execute())
            .thenAnswer((_) async => Success([subMenuModel]));
        cubit.getSubMenus();
      },
      expect: () => [
        SubMenuState.initial().copyWith(
          status: SubMenuStatus.loading,
        ),
        SubMenuState.initial()
            .copyWith(status: SubMenuStatus.success, subMenus: [subMenuModel]),
      ],
    );
    blocTest<SubMenuCubit, SubMenuState>(
      'Emits [SubMenuState.loading, SubMenuState.error] when getSubMenus fails',
      build: () => subMenuCubit,
      act: (cubit) {
        when(() => getSubMenusUseCaseMock.execute())
            .thenAnswer((_) async => Error(Failure('')));
        cubit.getSubMenus();
      },
      expect: () => [
        SubMenuState.initial().copyWith(
          status: SubMenuStatus.loading,
        ),
        SubMenuState.initial().copyWith(status: SubMenuStatus.error),
      ],
    );
  });

  group('Get Order tests', () {
    blocTest<SubMenuCubit, SubMenuState>(
      'Emits [SubMenuState.loading, SubMenuState.success] when getOrder is called successfully',
      build: () => subMenuCubit,
      act: (cubit) {
        when(() => getOrderUseCaseMock.execute())
            .thenAnswer((_) => const Success([orderItemModel]));
        cubit.getOrder();
      },
      expect: () => [
        SubMenuState.initial().copyWith(
          status: SubMenuStatus.loading,
        ),
        SubMenuState.initial()
            .copyWith(status: SubMenuStatus.success, order: [orderItemModel]),
      ],
    );
    blocTest<SubMenuCubit, SubMenuState>(
      'Emits [SubMenuState.loading, SubMenuState.error] when getOrder fails',
      build: () => subMenuCubit,
      act: (cubit) {
        when(() => getOrderUseCaseMock.execute())
            .thenAnswer((_) => Error(Failure('')));
        cubit.getOrder();
      },
      expect: () => [
        SubMenuState.initial().copyWith(
          status: SubMenuStatus.loading,
        ),
        SubMenuState.initial().copyWith(status: SubMenuStatus.error),
      ],
    );
  });
}
