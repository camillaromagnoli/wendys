import 'package:mocktail/mocktail.dart';
import 'package:wendys/features/menu/presentation/cubit/menu/menu_cubit.dart';
import 'package:wendys/features/menu/presentation/cubit/sub_menu/sub_menu_cubit.dart';
import 'package:wendys/features/order/presentation/cubit/order/order_cubit.dart';

class SubMenuCubitMock extends Mock implements SubMenuCubit {}

class MenuCubitMock extends Mock implements MenuCubit {}

class OrderCubitMock extends Mock implements OrderCubit {}
