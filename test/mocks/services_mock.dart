import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wendys/core/adapters/network_adapter.dart';
import 'package:wendys/features/menu/data/responses/cache_response.dart';
import 'package:wendys/features/order/data/services/order_service.dart';
import 'package:wendys/features/menu/data/services/menu_service.dart';

class MockNetworkAdapter extends Mock implements NetworkAdapter {}

class MockBoxCacheResponse<T> extends Mock implements Box<CacheResponse?> {}

class MockHive extends Mock implements HiveInterface {}

class OrderServiceMock extends Mock implements OrderService {}

class MenuServiceMock extends Mock implements MenuService {}
