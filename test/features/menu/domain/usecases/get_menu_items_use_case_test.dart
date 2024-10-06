import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/menu/domain/repository/menu_repository.dart';
import 'package:wendys/features/menu/domain/usecases/get_menu_items_use_case.dart';

import '../../../../mocks/repositories_mock.dart';
import '../../../../mocks/response_mocks.dart';

void main() {
  late MenuRepository menuRepositoryMock;
  late GetMenuItemsUseCase getMenuItemsUseCase;

  setUp(() async {
    menuRepositoryMock = MenuRepositoryMock();
    getMenuItemsUseCase = GetMenuItemsUseCaseImpl(menuRepositoryMock);
  });

  test('Should return a list of MenuItemEntity when the response is a success',
      () async {
    when(() => menuRepositoryMock.getMenuItems([31535, 30000, 31704]))
        .thenAnswer((_) async => const Success([menuItemModel]));

    final result = await getMenuItemsUseCase.execute([31535, 30000, 31704]);

    expect(result, isA<Success>());

    expect(result.tryGetSuccess(), equals([menuItemModel]));
  });

  test('Should throw a Failure when the response is an error ', () async {
    when(() => menuRepositoryMock.getMenuItems([31535, 30000, 31704]))
        .thenAnswer((_) async => Error(Failure('')));

    final result = await getMenuItemsUseCase.execute([31535, 30000, 31704]);

    expect(result.isError(), true);

    expect(result.tryGetError(), isA<Failure>());
  });
}
