import 'package:flutter/material.dart';
import 'package:hava_app/product/utils/widget_sizes.dart';

class PagePadding extends EdgeInsets {
  /// Padding is 8
  const PagePadding.allVeryLow() : super.all(WidgetSizes.spacingXs);

  /// Padding is 20
  const PagePadding.all() : super.all(WidgetSizes.spacingL);
}
