import 'package:flutter/widgets.dart';

class ItemConfig {
  final String? title;
  final Widget icon;
  final Widget inactiveIcon;
  final Color activeForegroundColor;

  ItemConfig({
    required this.title,
    required this.icon,
    required this.inactiveIcon,
    required this.activeForegroundColor,
  });
}
