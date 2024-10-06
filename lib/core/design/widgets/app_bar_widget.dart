import 'package:flutter/material.dart';

class WendysAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WendysAppBar({
    required this.title,
    this.actions,
    this.useBackButton = true,
    this.leading,
    this.onTapLeading,
    super.key,
  });

  final String title;
  final List<Widget>? actions;
  final bool useBackButton;
  final Widget? leading;
  final Function()? onTapLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      leading: useBackButton && onTapLeading != null
          ? IconButton(
              onPressed: onTapLeading!,
              icon: const Icon(
                Icons.arrow_back,
              ),
            )
          : leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
