import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wendys/features/menu/data/responses/cache_response.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';
import 'core/di/injection.dart';
import 'core/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(OrderItemEntityAdapter());
  Hive.registerAdapter(CacheResponseAdapter());

  if (!Hive.isBoxOpen('orderBox')) {
    await Hive.openBox<OrderItemEntity>('orderBox');
  }

  if (!Hive.isBoxOpen('cacheBox')) {
    await Hive.openBox<CacheResponse?>('cacheBox');
  }

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Wendys',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
