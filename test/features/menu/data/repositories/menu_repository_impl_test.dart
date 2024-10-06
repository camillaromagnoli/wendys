import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/menu/data/repositories/menu_repository_impl.dart';
import 'package:wendys/features/menu/domain/repository/menu_repository.dart';

import '../../../../mocks/response_mocks.dart';
import '../../../../mocks/services_mock.dart';

void main() {
  late MenuServiceMock menuServiceMock;
  late MenuRepository menuRepository;

  setUp(() async {
    menuServiceMock = MenuServiceMock();
    menuRepository = MenuRepositoryImpl(menuServiceMock);
  });
  group('Get SubMenus tests', () {
    test('Should return a list of SubMenuEntity when the response is a success',
        () async {
      when(() => menuServiceMock.getMenuList())
          .thenAnswer((_) async => getSiteMenu);

      final result = await menuRepository.getSubMenus();

      expect(result, isA<Success>());

      expect(result.tryGetSuccess(), equals([subMenuModel]));
    });

    test(
        'Should throw a network exception when the request is an error and the type is unknown',
        () async {
      when(() => menuServiceMock.getMenuList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
        ),
      );

      final result = await menuRepository.getSubMenus();

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<NetworkException>());
    });

    test(
        'Should throw a network exception when the request is an error and the type is unknown',
        () async {
      when(() => menuServiceMock.getMenuList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      final result = await menuRepository.getSubMenus();

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<NetworkException>());
    });

    test(
        'Should throw a server exception when the request is an error, the type is not unknown or connection timeout and the response is not null',
        () async {
      when(() => menuServiceMock.getMenuList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(requestOptions: RequestOptions(), data: {}),
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await menuRepository.getSubMenus();

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<ServerException>());
    });

    test('Should throw a generic failure when the exception is not mapped',
        () async {
      when(() => menuServiceMock.getMenuList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: null,
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await menuRepository.getSubMenus();

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<Failure>());
    });
  });

  group('Get MenuItems tests', () {
    test('Should return a list of SubMenuModel when the response is a success',
        () async {
      when(() => menuServiceMock.getMenuList())
          .thenAnswer((_) async => getSiteMenu);

      final result = await menuRepository.getMenuItems([31535, 30000, 31704]);

      expect(result, isA<Success>());

      expect(result.tryGetSuccess(), equals([menuItemModel]));
    });

    test(
        'Should throw a network exception when the request is an error and the type is unknown',
        () async {
      when(() => menuServiceMock.getMenuList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
        ),
      );

      final result = await menuRepository.getMenuItems([31535, 30000, 31704]);

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<NetworkException>());
    });

    test(
        'Should throw a network exception when the request is an error and the type is unknown',
        () async {
      when(() => menuServiceMock.getMenuList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      final result = await menuRepository.getMenuItems([31535, 30000, 31704]);

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<NetworkException>());
    });

    test(
        'Should throw a server exception when the request is an error, the type is not unknown or connection timeout and the response is not null',
        () async {
      when(() => menuServiceMock.getMenuList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(requestOptions: RequestOptions(), data: {}),
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await menuRepository.getMenuItems([31535, 30000, 31704]);

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<ServerException>());
    });

    test('Should throw a generic failure when the exception is not mapped',
        () async {
      when(() => menuServiceMock.getMenuList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: null,
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await menuRepository.getMenuItems([31535, 30000, 31704]);

      expect(result.isError(), true);

      expect(result.tryGetError(), isA<Failure>());
    });
  });
}
