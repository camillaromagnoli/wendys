import 'package:flutter/material.dart';

class WendysDialog extends StatelessWidget {
  const WendysDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}

void showWendysDialog(
  BuildContext context,
  String message,
) {
  showDialog(
    context: context,
    builder: (context) {
      return WendysDialog(
        message: message,
      );
    },
  );
}
