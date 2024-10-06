import 'package:flutter/material.dart';

class WendysBadge extends StatelessWidget {
  const WendysBadge({
    super.key,
    required this.content,
    this.onTap,
  });

  final String content;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
