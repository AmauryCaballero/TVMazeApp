import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget get centered => Center(child: this);

  Widget get padded => Padding(padding: const EdgeInsets.all(8.0), child: this);

  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(8.0)]) =>
      Padding(padding: value, child: this);
}

extension OpacityExtension on Widget {
  Widget opacity(double opacity) {
    assert(
        opacity >= 0.0 && opacity <= 1.0, 'Opacity must be between 0.0 & 1.0');

    return Opacity(
      opacity: opacity,
      child: this,
    );
  }
}
