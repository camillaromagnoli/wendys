import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:wendys/core/exceptions/failure.dart';

import '../entities/sub_menu_entity.dart';
import '../repository/menu_repository.dart';

abstract class GetSubMenusUseCase {
  Future<Result<List<SubMenuEntity>, Failure>> execute();
}

@Injectable(as: GetSubMenusUseCase)
class GetSubMenusUseCaseImpl extends GetSubMenusUseCase {
  GetSubMenusUseCaseImpl(this._repository);

  final MenuRepository _repository;

  @override
  Future<Result<List<SubMenuEntity>, Failure>> execute() async {
    return await _repository.getSubMenus();
  }
}
