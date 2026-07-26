import 'package:flutter/material.dart';

/// Animated pulsing indicator dot for live market session and WebSocket connectivity status.
class LiveStatusDot extends StatefulWidget {
  final Color color;
  final double size;

  const LiveStatusDot({
    super.key,
    required this.color,
    this.size = 10.0,
  });

  @override
  State<LiveStatusDot> createState() => _LiveStatusDotState();
}

class _LiveStatusDotState extends State<LiveStatusDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _scaleAnimation = Tween<double>(begin: 1.0, end: 2.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.6, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * 2.2,
      height: widget.size * 2.2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color.withValues(alpha: _opacityAnimation.value),
                  ),
                ),
              );
            },
          ),
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
            ),
          ),
        ],
      ),
    );
  }
}
