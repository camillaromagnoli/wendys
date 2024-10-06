import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wendys/core/di/injection.dart';
import 'package:wendys/core/routes/app_route_paths.dart';
import 'package:wendys/features/menu/data/model/sub_menu_model.dart';
import 'package:wendys/features/menu/domain/entities/menu_item_entity.dart';
import 'package:wendys/features/menu/presentation/cubit/menu/menu_cubit.dart';
import 'package:wendys/features/menu/presentation/cubit/sub_menu/sub_menu_cubit.dart';
import 'package:wendys/features/menu/presentation/pages/categories_page.dart';
import 'package:wendys/features/menu/presentation/pages/menu_item_page.dart';
import 'package:wendys/features/menu/presentation/pages/menu_page.dart';
import 'package:wendys/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:wendys/features/order/presentation/pages/order_page.dart';

final appRoutes = <GoRoute>[
  GoRoute(
      path: AppRoutePaths.categoriesPath,
      builder: (context, state) {
        return BlocProvider<SubMenuCubit>(
          create: (context) => getIt<SubMenuCubit>(),
          child: const CategoriesPage(),
        );
      }),
  GoRoute(
      path: AppRoutePaths.menuPath,
      builder: (context, state) {
        SubMenuModel subMenuModel = state.extra as SubMenuModel;
        return BlocProvider<MenuCubit>(
          create: (context) => getIt<MenuCubit>(),
          child: MenuPage(
            subMenuModel: subMenuModel,
          ),
        );
      }),
  GoRoute(
    path: AppRoutePaths.menuItem,
    builder: (context, state) {
      final menuItem = state.extra as MenuItemEntity;
      return BlocProvider<MenuCubit>(
        create: (context) => getIt<MenuCubit>(),
        child: MenuItemPage(
          menuItem: menuItem,
        ),
      );
    },
  ),
  GoRoute(
    path: AppRoutePaths.order,
    builder: (context, state) {
      return BlocProvider<OrderCubit>(
        create: (context) => getIt<OrderCubit>(),
        child: const OrderPage(),
      );
    },
  ),
];
