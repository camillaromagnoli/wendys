import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wendys/features/menu/domain/entities/menu_item_entity.dart';
import 'package:wendys/features/menu/domain/entities/sub_menu_entity.dart';
import 'package:wendys/features/menu/domain/usecases/get_menu_items_use_case.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';
import 'package:wendys/features/order/domain/usecases/save_order_item_use_case.dart';

part 'menu_state.dart';

@Injectable()
class MenuCubit extends Cubit<MenuState> {
  final GetMenuItemsUseCase _getMenuItemsUseCase;
  final SaveOrderItemUseCase _saveOrderItemUseCase;

  MenuCubit({
    required GetMenuItemsUseCase getMenuItemsUseCase,
    required SaveOrderItemUseCase saveOrderItemUseCase,
  })  : _getMenuItemsUseCase = getMenuItemsUseCase,
        _saveOrderItemUseCase = saveOrderItemUseCase,
        super(MenuState.initial());

  Future<void> getMenuItems(List<int> menuItemIds) async {
    emit(state.copyWith(status: MenuStatus.loading));
    final result = await _getMenuItemsUseCase.execute(menuItemIds);
    result.when(
      (success) {
        emit(state.copyWith(status: MenuStatus.success, menuItems: success));
      },
      (error) {
        emit(state.copyWith(status: MenuStatus.error));
      },
    );
  }

  Future<void> saveOrderItem(OrderItemEntity order) async {
    emit(state.copyWith(status: MenuStatus.loading));
    final result = await _saveOrderItemUseCase.execute(order);
    result.when(
      (success) {
        emit(
          state.copyWith(
            status: MenuStatus.success,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            status: MenuStatus.error,
          ),
        );
      },
    );
  }
}
