import 'dart:math';

import 'package:multi_split_view_next/src/divider_painter.dart';
import 'package:multi_split_view_next/src/multi_split_view.dart';

/// The [MultiSplitView] theme.
/// Defines the configuration of the overall visual [MultiSplitViewTheme] for a widget subtree within the app.
class MultiSplitViewThemeData {
  static const double defaultDividerThickness = 10.0;

  static const double defaultDividerGrabbingSize = 10.0;

  /// Builds a theme data.
  /// The [dividerThickness] argument must also be positive.
  MultiSplitViewThemeData(
      {this.dividerThickness = defaultDividerThickness,
      double dividerGrabbingSize = defaultDividerGrabbingSize,
      this.dividerPainter})
      : dividerGrabbingSize = max(dividerGrabbingSize, dividerThickness) {
    if (dividerThickness < 0) {
      throw ArgumentError('The value cannot be negative: $dividerThickness.',
          'dividerThickness');
    }
  }

  /// Defines the divider thickness. The default value is 10.0.
  final double dividerThickness;

  /// Defines the divider grabbing size. The default value is 10.0.
  final double dividerGrabbingSize;

  /// Defines a divider painter. The default value is [NULL].
  final DividerPainter? dividerPainter;
}
