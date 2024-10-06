import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/menu/data/model/menu_item_model.dart';
import 'package:wendys/features/menu/data/model/sub_menu_model.dart';
import 'package:wendys/features/menu/data/services/menu_service.dart';
import 'package:wendys/features/menu/domain/entities/menu_item_entity.dart';
import 'package:wendys/features/menu/domain/entities/sub_menu_entity.dart';
import 'package:wendys/features/menu/domain/repository/menu_repository.dart';

@Injectable(as: MenuRepository)
class MenuRepositoryImpl extends MenuRepository {
  MenuRepositoryImpl(this._menuService);

  final MenuService _menuService;

  @override
  Future<Result<List<SubMenuEntity>, Failure>> getSubMenus() async {
    try {
      final Map<String, dynamic> data = await _menuService.getMenuList();
      final List<dynamic> response =
          data['menuLists']['subMenus'] as List<dynamic>;

      final List<SubMenuModel> subMenusList = response.map((dynamic subMenu) {
        final Map<String, dynamic> subMenuMap =
            Map<String, dynamic>.from(subMenu);
        return SubMenuModel.fromJson(subMenuMap);
      }).toList();

      return Success(subMenusList);
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }

  @override
  Future<Result<List<MenuItemEntity>, Failure>> getMenuItems(
      List<int> menuItemIds) async {
    try {
      final data = await _menuService.getMenuList();
      final List<dynamic> response =
          data['menuLists']['menuItems'] as List<dynamic>;

      final List<MenuItemModel> menuItemsList = response.map((dynamic subMenu) {
        final Map<String, dynamic> subMenuMap =
            Map<String, dynamic>.from(subMenu);
        return MenuItemModel.fromJson(subMenuMap);
      }).toList();

      final List<MenuItemModel> menuItemsFiltered = menuItemsList
          .where((item) => menuItemIds.contains(item.menuItemId))
          .toList();

      return Success(menuItemsFiltered);
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }
}
