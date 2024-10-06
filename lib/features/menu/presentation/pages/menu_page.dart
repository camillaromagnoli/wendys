import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wendys/core/design/widgets/app_bar_widget.dart';
import 'package:wendys/core/design/widgets/circular_progress_indicator_widget.dart';
import 'package:wendys/core/design/widgets/dialog_widget.dart';
import 'package:wendys/core/routes/app_route_paths.dart';
import 'package:wendys/core/utils/app_texts.dart';
import 'package:wendys/features/menu/data/model/sub_menu_model.dart';
import 'package:wendys/features/menu/domain/entities/menu_item_entity.dart';
import 'package:wendys/features/menu/presentation/cubit/menu/menu_cubit.dart';
import 'package:wendys/core/design/widgets/wendys_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    required this.subMenuModel,
    super.key,
  });

  final SubMenuModel subMenuModel;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    context.read<MenuCubit>().getMenuItems(widget.subMenuModel.menuItems);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (_, state) {
        if (state.status == MenuStatus.error) {
          showWendysDialog(
            context,
            AppTexts.genericFailure,
          );
        }
      },
      builder: (_, state) {
        return Scaffold(
          appBar: WendysAppBar(
            title: widget.subMenuModel.name,
            onTapLeading: () => context.pop(true),
          ),
          body: state.status == MenuStatus.loading
              ? const Center(
                  child: WendysCircularProgressIndicator(),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: state.menuItems.length,
                  itemBuilder: (_, index) {
                    final MenuItemEntity menuItem = state.menuItems[index];
                    return WendysCard(
                      title: menuItem.name,
                      onTap: () {
                        context.push(
                          AppRoutePaths.menuItem,
                          extra: menuItem,
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
