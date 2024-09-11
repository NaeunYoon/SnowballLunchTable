import 'package:flutter/material.dart';
import 'package:lunch/icon/snow_flake_icons.dart';

class SnowIcon extends StatefulWidget {
  final Color iconColor;
  final VoidCallback function;
  final String name;
  const SnowIcon({
    super.key,
    required this.iconColor,
    required this.function,
    required this.name,
  });

  @override
  State<SnowIcon> createState() => _SnowIconState();
}

class _SnowIconState extends State<SnowIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          child: Icon(SnowFlake.snowflake, size: 100, color: widget.iconColor),
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * 3.14, // 360도 회전
              child: child,
            );
          },
        ),
        Text(
          widget.name,
          style: const TextStyle(
            fontFamily: 'BlackHanSans',
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
