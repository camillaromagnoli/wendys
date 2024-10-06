import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wendys/features/menu/domain/entities/sub_menu_entity.dart';
import 'package:wendys/features/menu/domain/usecases/get_sub_menus_use_case.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';
import 'package:wendys/features/order/domain/usecases/get_order_use_case.dart';

part 'sub_menu_state.dart';

@Injectable()
class SubMenuCubit extends Cubit<SubMenuState> {
  final GetSubMenusUseCase _getSubMenusUseCase;
  final GetOrderUseCase _getOrderUseCase;

  SubMenuCubit({
    required GetSubMenusUseCase getSubMenusUseCase,
    required GetOrderUseCase getOrderUseCase,
  })  : _getSubMenusUseCase = getSubMenusUseCase,
        _getOrderUseCase = getOrderUseCase,
        super(SubMenuState.initial());

  Future<void> getSubMenus() async {
    emit(state.copyWith(status: SubMenuStatus.loading));
    final result = await _getSubMenusUseCase.execute();

    result.when(
      (success) {
        emit(
          state.copyWith(
            status: SubMenuStatus.success,
            subMenus: success,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            status: SubMenuStatus.error,
          ),
        );
      },
    );
  }

  Future<void> getOrder() async {
    emit(state.copyWith(status: SubMenuStatus.loading));
    final result = _getOrderUseCase.execute();

    result.when(
      (success) {
        emit(
          state.copyWith(
            status: SubMenuStatus.success,
            order: success,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            status: SubMenuStatus.error,
          ),
        );
      },
    );
  }
}
