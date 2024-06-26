import 'dart:ui';

import 'package:flutter/material.dart';

class FrostyBackground extends StatelessWidget {
  final Widget child;

  const FrostyBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Theme.of(context).canvasColor.withOpacity(0.5),
          ),
        ),
        child,
      ],
    );
  }
}
