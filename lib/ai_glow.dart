/// ai_glow
///
/// A small Flutter package that provides two simple widgets to add an
/// animated, colorful glow effect to any UI element.
///
/// Public API:
/// * [InnerAiGlowing] - paints an animated glow inside the widget area.
/// * [OuterAiGlow] - paints an animated glow around the outside of the widget.
///
/// Both widgets are intentionally minimal and intended to be composed with
/// other Flutter widgets. They expose common visual tuning parameters like
/// [colors], [glowWidth], [blur], and [borderRadius].
library;

export 'src/inner_ai_glow.dart';
export 'src/outer_ai_glow.dart';

/// A tiny example utility left in the package for tests and examples.
///
/// This simple [Calculator] is not part of the glow UI API and is provided
/// only as a lightweight utility used by the package's example and tests.
class Calculator {
  /// Returns [value] plus 1.
  ///
  /// Example:
  ///
  /// ```dart
  /// final c = Calculator();
  /// expect(c.addOne(41), 42);
  /// ```
  int addOne(int value) => value + 1;
}
