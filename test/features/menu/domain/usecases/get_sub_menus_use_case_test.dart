import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/menu/domain/repository/menu_repository.dart';
import 'package:wendys/features/menu/domain/usecases/get_sub_menus_use_case.dart';

import '../../../../mocks/repositories_mock.dart';
import '../../../../mocks/response_mocks.dart';

void main() {
  late MenuRepository menuRepositoryMock;
  late GetSubMenusUseCase getSubMenusUseCase;

  setUp(() async {
    menuRepositoryMock = MenuRepositoryMock();
    getSubMenusUseCase = GetSubMenusUseCaseImpl(menuRepositoryMock);
  });

  test('Should return a list of SubMenus when the response is a success',
      () async {
    when(() => menuRepositoryMock.getSubMenus())
        .thenAnswer((_) async => Success([subMenuModel]));

    final result = await getSubMenusUseCase.execute();

    expect(result, isA<Success>());

    expect(result.tryGetSuccess(), equals([subMenuModel]));
  });

  test('Should throw a Failure when the response is an error ', () async {
    when(() => menuRepositoryMock.getSubMenus())
        .thenAnswer((_) async => Error(Failure('')));

    final result = await getSubMenusUseCase.execute();

    expect(result.isError(), true);

    expect(result.tryGetError(), isA<Failure>());
  });
}
