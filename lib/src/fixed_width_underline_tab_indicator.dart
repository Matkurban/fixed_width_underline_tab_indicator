import 'package:flutter/material.dart';

/// 固定宽度下划线指示器
class FixedWidthUnderlineTabIndicator extends Decoration {
  const FixedWidthUnderlineTabIndicator({
    required this.borderSide,
    required this.width,
    this.insets = EdgeInsets.zero,
  });

  final BorderSide borderSide;

  /// 指示器固定宽度
  final double width;
  final EdgeInsetsGeometry insets;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _FixedWidthUnderlinePainter(this, onChanged);
  }
}

class _FixedWidthUnderlinePainter extends BoxPainter {
  _FixedWidthUnderlinePainter(this.decoration, VoidCallback? onChanged)
    : super(onChanged);

  final FixedWidthUnderlineTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection =
        configuration.textDirection ?? TextDirection.ltr;
    final EdgeInsets resolvedInsets = decoration.insets.resolve(textDirection);
    final Rect indicatorRect = resolvedInsets.deflateRect(rect);

    final double centerX = indicatorRect.left + indicatorRect.width / 2;
    final double half = decoration.width / 2;
    final double y = indicatorRect.bottom - decoration.borderSide.width / 2;

    final Paint paint = decoration.borderSide.toPaint();
    canvas.drawLine(
      Offset(centerX - half, y),
      Offset(centerX + half, y),
      paint,
    );
  }
}
