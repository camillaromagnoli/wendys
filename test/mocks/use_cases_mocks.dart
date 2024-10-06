import 'package:mocktail/mocktail.dart';
import 'package:wendys/features/menu/domain/usecases/get_menu_items_use_case.dart';
import 'package:wendys/features/menu/domain/usecases/get_sub_menus_use_case.dart';
import 'package:wendys/features/order/domain/usecases/delete_order_item_use_case.dart';
import 'package:wendys/features/order/domain/usecases/get_order_use_case.dart';
import 'package:wendys/features/order/domain/usecases/save_order_item_use_case.dart';

class GetSubMenusUseCaseMock extends Mock implements GetSubMenusUseCase {}

class GetMenu extends Mock implements GetSubMenusUseCase {}

class SaveOrderItemUseCaseMock extends Mock implements SaveOrderItemUseCase {}

class GetOrderUseCaseMock extends Mock implements GetOrderUseCase {}

class GetMenuItemsUseCaseMock extends Mock implements GetMenuItemsUseCase {}

class DeleteOrderItemUseCaseMock extends Mock
    implements DeleteOrderItemUseCase {}
