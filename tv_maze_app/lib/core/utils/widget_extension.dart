import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget get centered => Center(child: this);

  Widget get padded => Padding(padding: const EdgeInsets.all(8.0), child: this);

  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(8.0)]) =>
      Padding(padding: value, child: this);
}
