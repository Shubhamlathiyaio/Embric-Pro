import 'package:flutter/material.dart';

double scaledFontSize(
  double baseSize,
  BuildContext context, {
  double scaleFactor = 0.04,
  String basedOn = 'w', // 'width', 'height', or 'ratio'
}) {
  final size = MediaQuery.of(context).size;
  const baseWidth = 375;
  const baseHeight = 812;

  double scaled = baseSize;

  if (basedOn == 'w') {
    final steps = (size.width - baseWidth) / 10;
    scaled += steps * scaleFactor;
  } else if (basedOn == 'h') {
    final steps = (size.height - baseHeight) / 10;
    scaled += steps * scaleFactor;
  } else if (basedOn == 'r') {
    final wSteps = (size.width - baseWidth) / 10;
    final hSteps = (size.height - baseHeight) / 10;
    final avgSteps = (wSteps + hSteps) / 2;
    scaled += avgSteps * scaleFactor;
  }

  return scaled.clamp(8.0, double.infinity); // optional limit
}
