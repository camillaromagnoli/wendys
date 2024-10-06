import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:wendys/core/di/injection.config.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();

  // @preResolve
  // @Named('cacheBox')
  // Future<Box<dynamic>> get cartBox async {
  //   return await Hive.openBox<dynamic>('cacheBox');
  // }

  // @preResolve
  // @Named('orderBox')
  // Future<Box<dynamic>> get orderBox async {
  //   Hive.registerAdapter(OrderEntityAdapter());

  //   return await Hive.openBox<OrderItemEntity>('orderBox');
  // }
}

class $RegisterModule extends RegisterModule {}

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
