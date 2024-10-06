import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/menu/domain/usecases/get_menu_items_use_case.dart';
import 'package:wendys/features/menu/presentation/cubit/menu/menu_cubit.dart';

import '../../../../../mocks/response_mocks.dart';
import '../../../../../mocks/use_cases_mocks.dart';

void main() {
  late GetMenuItemsUseCase getMenuItemsUseCaseMock;
  late SaveOrderItemUseCaseMock saveOrderItemUseCaseMock;
  late MenuCubit menuCubit;

  setUp(() {
    getMenuItemsUseCaseMock = GetMenuItemsUseCaseMock();
    saveOrderItemUseCaseMock = SaveOrderItemUseCaseMock();

    menuCubit = MenuCubit(
      getMenuItemsUseCase: getMenuItemsUseCaseMock,
      saveOrderItemUseCase: saveOrderItemUseCaseMock,
    );
  });

  tearDown(() {
    menuCubit.close();
  });

  test('Initial state is MenuInitial', () {
    expect(menuCubit.state, MenuState.initial());
  });

  group('Get MenuItems tests', () {
    blocTest<MenuCubit, MenuState>(
      'Emits [MenuState.loading, MenuState.success] when getMenuItems is called successfully',
      build: () => menuCubit,
      act: (cubit) {
        when(() => getMenuItemsUseCaseMock.execute([31535, 30000, 31704]))
            .thenAnswer((_) async => const Success([menuItemModel]));
        cubit.getMenuItems([31535, 30000, 31704]);
      },
      expect: () => [
        MenuState.initial().copyWith(
          status: MenuStatus.loading,
        ),
        MenuState.initial()
            .copyWith(status: MenuStatus.success, menuItems: [menuItemModel]),
      ],
    );
    blocTest<MenuCubit, MenuState>(
      'Emits [MenuState.loading, MenuState.error] when getMenuItems fails',
      build: () => menuCubit,
      act: (cubit) {
        when(() => getMenuItemsUseCaseMock.execute([31535, 30000, 31704]))
            .thenAnswer((_) async => Error(Failure('')));
        cubit.getMenuItems([31535, 30000, 31704]);
      },
      expect: () => [
        MenuState.initial().copyWith(
          status: MenuStatus.loading,
        ),
        MenuState.initial().copyWith(status: MenuStatus.error),
      ],
    );
  });

  group('Save Order Item tests', () {
    blocTest<MenuCubit, MenuState>(
      'Emits [MenuState.loading, MenuState.success] when saveOrderItem is called successfully',
      build: () => menuCubit,
      act: (cubit) {
        when(() => saveOrderItemUseCaseMock.execute(orderItemModel))
            .thenAnswer((_) async => Success({}));
        cubit.saveOrderItem(orderItemModel);
      },
      expect: () => [
        MenuState.initial().copyWith(
          status: MenuStatus.loading,
        ),
        MenuState.initial().copyWith(status: MenuStatus.success),
      ],
    );
    blocTest<MenuCubit, MenuState>(
      'Emits [MenuState.loading, MenuState.error] when getOrder fails',
      build: () => menuCubit,
      act: (cubit) {
        when(() => saveOrderItemUseCaseMock.execute(orderItemModel))
            .thenAnswer((_) async => Error(Failure('')));
        cubit.saveOrderItem(orderItemModel);
      },
      expect: () => [
        MenuState.initial().copyWith(
          status: MenuStatus.loading,
        ),
        MenuState.initial().copyWith(status: MenuStatus.error),
      ],
    );
  });
}
