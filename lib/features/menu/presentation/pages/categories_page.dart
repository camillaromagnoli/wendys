import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wendys/core/design/widgets/app_bar_widget.dart';
import 'package:wendys/core/design/widgets/badge_widget.dart';
import 'package:wendys/core/design/widgets/circular_progress_indicator_widget.dart';
import 'package:wendys/core/design/widgets/dialog_widget.dart';
import 'package:wendys/core/routes/app_route_paths.dart';
import 'package:wendys/core/utils/app_texts.dart';
import 'package:wendys/features/menu/presentation/cubit/sub_menu/sub_menu_cubit.dart';
import 'package:wendys/core/design/widgets/wendys_card.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final cubit = context.read<SubMenuCubit>();
        await cubit.getSubMenus();
        await cubit.getOrder();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SubMenuCubit>();
    return BlocConsumer<SubMenuCubit, SubMenuState>(
      listener: (_, state) {
        if (state.status == SubMenuStatus.error) {
          showWendysDialog(
            context,
            AppTexts.genericFailure,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: WendysAppBar(
            title: AppTexts.categoriesTitle,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: WendysBadge(
                  onTap: () async {
                    final shouldRefreshOrder =
                        await context.push(AppRoutePaths.order) as bool?;
                    if (shouldRefreshOrder == true) {
                      cubit.getOrder();
                    }
                  },
                  content: state.order.length.toString(),
                ),
              ),
            ],
          ),
          body: state.status == SubMenuStatus.loading
              ? const Center(
                  child: WendysCircularProgressIndicator(),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: state.subMenus.length,
                  itemBuilder: (_, index) {
                    final subMenu = state.subMenus[index];

                    return WendysCard(
                      title: subMenu.name,
                      onTap: () async {
                        final shouldRefreshOrder = await context.push(
                          AppRoutePaths.menuPath,
                          extra: subMenu,
                        ) as bool?;
                        if (shouldRefreshOrder == true) {
                          cubit.getOrder();
                        }
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
