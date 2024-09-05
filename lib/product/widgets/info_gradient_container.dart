import 'package:flutter/material.dart';
import 'package:hava_app/feature/home/view/home_view.dart';
import 'package:hava_app/product/utils/page_padding.dart';

/// InfoGradientContainer is a widget that displays the information in a gradient container.
/// It is used in [WindInfoCard] and [SunEventsInfoCard].
/// It takes a [child] parameter and wraps it with a gradient container.
/// The gradient is from white to blue.
/// The gradient stops are at 0 and 0.8.
/// The gradient has a border radius of 8.
final class InfoGradientContainer extends StatelessWidget {
  const InfoGradientContainer({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.8),
                Colors.blue.shade400.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, 0.8],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
