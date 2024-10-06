import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:wendys/core/adapters/network_adapter.dart';
import 'package:wendys/core/api/api_routes.dart';
import 'package:wendys/features/menu/data/responses/cache_response.dart';

abstract class MenuService {
  Future<Map<String, dynamic>> getMenuList();
}

@Injectable(as: MenuService)
class MenuServiceImpl implements MenuService {
  final NetworkAdapter _networkAdapter;

  CacheResponse? _cachedData;

  MenuServiceImpl(
    this._networkAdapter,
  ) {
    _cachedData = Hive.box<CacheResponse?>('cacheBox').get('menuData');
  }

  @override
  Future<Map<String, dynamic>> getMenuList() async {
    Options options = Options(headers: {});

    if (_cachedData?.etag != null) {
      options.headers?['If-None-Match'] = _cachedData?.etag;
    }

    try {
      final Response response = await _networkAdapter.get(
        url: ApiRoutes.getSiteMenu,
        options: options,
      );

      if (response.statusCode != 304) {
        _cachedData = CacheResponse(
          response: response.data,
          etag: response.headers['etag']?.first,
        );

        await Hive.box<CacheResponse?>('cacheBox').put('menuData', _cachedData);

        return response.data;
      } else {
        return _cachedData?.response ?? {};
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 304) {
        return _cachedData?.response ?? {};
      }
      rethrow;
    }
  }
}
