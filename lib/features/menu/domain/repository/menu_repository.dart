import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';
import 'package:wendys/features/menu/domain/entities/menu_item_entity.dart';
import 'package:wendys/features/menu/domain/entities/sub_menu_entity.dart';

abstract class MenuRepository {
  Future<Result<List<SubMenuEntity>, Failure>> getSubMenus();
  Future<Result<List<MenuItemEntity>, Failure>> getMenuItems(
    List<int> menuItemIds,
  );
}
