import 'package:flutter/material.dart';

void ShowModalBottomSheet({
  required BuildContext context,
  required Widget widget,
}) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      context: context,
      builder: (context) {
        return widget;
      });
}
