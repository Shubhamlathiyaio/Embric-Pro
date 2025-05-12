
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle titleRed(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle totalHeading(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }

  static TextStyle totalValue(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontWeight: FontWeight.bold,
        );
  }
}
