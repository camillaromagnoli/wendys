// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/menu/data/repositories/menu_repository_impl.dart'
    as _i13;
import '../../features/menu/data/services/menu_service.dart' as _i6;
import '../../features/menu/domain/repository/menu_repository.dart' as _i12;
import '../../features/menu/domain/usecases/get_menu_items_use_case.dart'
    as _i15;
import '../../features/menu/domain/usecases/get_sub_menus_use_case.dart'
    as _i16;
import '../../features/menu/presentation/cubit/menu/menu_cubit.dart' as _i17;
import '../../features/menu/presentation/cubit/sub_menu/sub_menu_cubit.dart'
    as _i18;
import '../../features/order/data/repositories/order_repository_impl.dart'
    as _i8;
import '../../features/order/data/services/order_service.dart' as _i5;
import '../../features/order/domain/repositories/order_repository.dart' as _i7;
import '../../features/order/domain/usecases/delete_order_item_use_case.dart'
    as _i10;
import '../../features/order/domain/usecases/get_order_use_case.dart' as _i11;
import '../../features/order/domain/usecases/save_order_item_use_case.dart'
    as _i9;
import '../../features/order/presentation/cubit/order/order_cubit.dart' as _i14;
import '../adapters/network_adapter.dart' as _i4;
import 'injection.dart' as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.factory<_i4.NetworkAdapter>(() => _i4.NetworkAdapterImpl(gh<_i3.Dio>()));
    gh.factory<_i5.OrderService>(() => _i5.OrderServiceImpl());
    gh.factory<_i6.MenuService>(
        () => _i6.MenuServiceImpl(gh<_i4.NetworkAdapter>()));
    gh.factory<_i7.OrderRepository>(
        () => _i8.OrderRepositoryImpl(gh<_i5.OrderService>()));
    gh.factory<_i9.SaveOrderItemUseCase>(
        () => _i9.SaveOrderItemUseCaseImpl(gh<_i7.OrderRepository>()));
    gh.factory<_i10.DeleteOrderItemUseCase>(
        () => _i10.DeleteOrderItemUseCaseImpl(gh<_i7.OrderRepository>()));
    gh.factory<_i11.GetOrderUseCase>(
        () => _i11.GetOrderUseCaseImpl(gh<_i7.OrderRepository>()));
    gh.factory<_i12.MenuRepository>(
        () => _i13.MenuRepositoryImpl(gh<_i6.MenuService>()));
    gh.factory<_i14.OrderCubit>(() => _i14.OrderCubit(
          getOrderUseCase: gh<_i11.GetOrderUseCase>(),
          deleteOrderItemUseCase: gh<_i10.DeleteOrderItemUseCase>(),
        ));
    gh.factory<_i15.GetMenuItemsUseCase>(
        () => _i15.GetMenuItemsUseCaseImpl(gh<_i12.MenuRepository>()));
    gh.factory<_i16.GetSubMenusUseCase>(
        () => _i16.GetSubMenusUseCaseImpl(gh<_i12.MenuRepository>()));
    gh.factory<_i17.MenuCubit>(() => _i17.MenuCubit(
          getMenuItemsUseCase: gh<_i15.GetMenuItemsUseCase>(),
          saveOrderItemUseCase: gh<_i9.SaveOrderItemUseCase>(),
        ));
    gh.factory<_i18.SubMenuCubit>(() => _i18.SubMenuCubit(
          getSubMenusUseCase: gh<_i16.GetSubMenusUseCase>(),
          getOrderUseCase: gh<_i11.GetOrderUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i19.RegisterModule {}
