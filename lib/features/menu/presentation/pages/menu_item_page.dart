import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wendys/core/design/widgets/app_bar_widget.dart';
import 'package:wendys/core/routes/app_route_paths.dart';
import 'package:wendys/core/utils/app_texts.dart';
import 'package:wendys/features/menu/domain/entities/menu_item_entity.dart';
import 'package:wendys/features/menu/presentation/cubit/menu/menu_cubit.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';

class MenuItemPage extends StatefulWidget {
  const MenuItemPage({
    required this.menuItem,
    super.key,
  });

  final MenuItemEntity menuItem;

  @override
  State<MenuItemPage> createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  @override
  Widget build(BuildContext context) {
    final MenuCubit menuCubit = context.read<MenuCubit>();
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (_, state) {
        if (state.status == MenuStatus.success) {
          ScaffoldMessenger.of(_).showSnackBar(
            SnackBar(
              content: Text(
                '${widget.menuItem.name} ${AppTexts.itemAdded}',
              ),
              action: SnackBarAction(
                label: AppTexts.navigate,
                onPressed: () => context.push(
                  AppRoutePaths.order,
                ),
              ),
            ),
          );
        }
      },
      builder: (_, state) => Scaffold(
        appBar: WendysAppBar(
          title: widget.menuItem.name,
          onTapLeading: () => context.pop(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widget.menuItem.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(widget.menuItem.description ?? ''),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () async {
            await menuCubit.saveOrderItem(
              OrderItemEntity(
                name: widget.menuItem.name,
                menuItemId: widget.menuItem.menuItemId,
                priceRange: widget.menuItem.priceRange,
                quantity: 1,
              ),
            );
          },
        ),
      ),
    );
  }
}
