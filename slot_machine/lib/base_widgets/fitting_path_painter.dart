import 'dart:math';

import 'package:flutter/cupertino.dart';

class FittingPathPainter extends CustomPainter {
  const FittingPathPainter({
    required Path path,
    required Paint paint,
  })  : _path = path,
        _paint = paint;

  final Path _path;
  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    final pathBounds = _path.getBounds();
    final scaleX = size.width / pathBounds.width;
    final scaleY = size.height / pathBounds.height;
    final scale = min(
      scaleX > 0.0001 ? scaleX : double.infinity,
      scaleY > 0.0001 ? scaleY : double.infinity,
    );
    if (scale.isInfinite) {
      return canvas.drawPath(_path, _paint);
    }

    final scaleMatrix = Matrix4.identity()..scale(scale, scale);
    final scaledPath = _path.transform(scaleMatrix.storage);
    return canvas.drawPath(scaledPath, _paint);
  }

  @override
  bool shouldRepaint(FittingPathPainter oldDelegate) {
    return oldDelegate._path != _path || oldDelegate._paint != _paint;
  }
}
