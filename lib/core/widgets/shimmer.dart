import 'dart:math';

import 'package:flutter/material.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
  });
  final double width;
  final double height;
  final BorderRadius borderRadius;

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
  borderRadius: widget.borderRadius,
  child: AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: Colors.grey[100],
        alignment: Alignment.bottomLeft,
        child: LayoutBuilder(
          builder: (context,cons) => Transform.translate(
            offset: Offset(cons.maxWidth * _controller.value, 0), // Move horizontally/
            child: Container(
              height: 500,
              width: 0,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[50]!,
                    blurRadius: 20,
                    spreadRadius: 20,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  ),
);

  }
}
