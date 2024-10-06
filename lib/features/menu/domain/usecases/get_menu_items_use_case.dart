import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';

import '../entities/menu_item_entity.dart';
import '../repository/menu_repository.dart';

abstract class GetMenuItemsUseCase {
  Future<Result<List<MenuItemEntity>, Failure>> execute(List<int> menuItemIds);
}

@Injectable(as: GetMenuItemsUseCase)
class GetMenuItemsUseCaseImpl extends GetMenuItemsUseCase {
  GetMenuItemsUseCaseImpl(this._repository);

  final MenuRepository _repository;

  @override
  Future<Result<List<MenuItemEntity>, Failure>> execute(
      List<int> menuItemIds) async {
    return await _repository.getMenuItems(menuItemIds);
  }
}
