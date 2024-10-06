import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wendys/core/design/widgets/app_bar_widget.dart';
import 'package:wendys/core/design/widgets/dialog_widget.dart';
import 'package:wendys/core/utils/app_texts.dart';
import 'package:wendys/features/order/domain/entities/order_item_entity.dart';
import 'package:wendys/features/order/presentation/cubit/order/order_cubit.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
  });

  @override
  State<OrderPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await context.read<OrderCubit>().getOrder();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>();

    return BlocConsumer<OrderCubit, OrderState>(
      listener: (_, state) {
        if (state.status == OrderStatus.error) {
          showWendysDialog(
            context,
            AppTexts.genericFailure,
          );
        }
      },
      builder: (_, state) => Scaffold(
        appBar: WendysAppBar(
          title: AppTexts.orderTitle,
          onTapLeading: () => context.pop(true),
        ),
        body: ListView.builder(
          itemCount: state.order.length,
          itemBuilder: (context, index) {
            final OrderItemEntity menuItemEntity = state.order[index];
            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AppTexts.item} ${menuItemEntity.name}',
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    '${AppTexts.price} ${menuItemEntity.priceRange.toString()}',
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                      '${AppTexts.quantity} ${menuItemEntity.quantity.toString()}'),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  cubit.deleteOrderItem(
                    state.order[index].menuItemId,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
