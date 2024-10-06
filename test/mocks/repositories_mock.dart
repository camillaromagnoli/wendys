import 'package:mocktail/mocktail.dart';
import 'package:wendys/features/menu/domain/repository/menu_repository.dart';
import 'package:wendys/features/order/domain/repositories/order_repository.dart';

class MenuRepositoryMock extends Mock implements MenuRepository {}

class OrderRepositoryMock extends Mock implements OrderRepository {}
