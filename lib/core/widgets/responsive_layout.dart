import 'package:flutter/material.dart';

/// Responsive layout helper with mobile, tablet, and desktop breakpoints.
/// Centers content and caps max-width for web/desktop screens to prevent awkward wide stretches.
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final double maxContentWidth;

  const ResponsiveLayout({super.key, required this.mobile, this.tablet, this.desktop, this.maxContentWidth = 1200.0});

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Widget content;
        if (constraints.maxWidth >= 1024 && desktop != null) {
          content = desktop!;
        } else if (constraints.maxWidth >= 600 && tablet != null) {
          content = tablet!;
        } else {
          content = mobile;
        }

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: content,
          ),
        );
      },
    );
  }
}
