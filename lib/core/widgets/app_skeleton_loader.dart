import 'package:flutter/material.dart';

/// Clean skeleton loader animations for smooth loading states throughout the app.
class AppSkeletonLoader extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const AppSkeletonLoader({super.key, required this.width, required this.height, this.borderRadius = 8.0});

  const AppSkeletonLoader.rectangular({super.key, required this.width, required this.height, this.borderRadius = 8.0});

  const AppSkeletonLoader.circular({super.key, required double size})
    : width = size,
      height = size,
      borderRadius = size / 2;

  @override
  State<AppSkeletonLoader> createState() => _AppSkeletonLoaderState();
}

class _AppSkeletonLoaderState extends State<AppSkeletonLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.3,
      end: 0.7,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: baseColor.withValues(alpha: _animation.value),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        );
      },
    );
  }
}

/// Helper card skeleton for stock tiles
class StockTileSkeleton extends StatelessWidget {
  const StockTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const AppSkeletonLoader.circular(size: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppSkeletonLoader.rectangular(width: 80, height: 16),
                SizedBox(height: 6),
                AppSkeletonLoader.rectangular(width: 140, height: 12),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              AppSkeletonLoader.rectangular(width: 70, height: 16),
              SizedBox(height: 6),
              AppSkeletonLoader.rectangular(width: 50, height: 20, borderRadius: 6),
            ],
          ),
        ],
      ),
    );
  }
}
