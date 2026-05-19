import 'package:flutter/material.dart';

double calculateTextHeight(
  String text,
  TextStyle style,
  double maxWidth,
  EdgeInsets padding, {
  bool softWrap = true,
}) {
  // Replace hyphens with non-breaking hyphens (U+2011) so that dash-joined
  // words are never split across lines, while spaces remain valid break points.
  final normalizedText = text.replaceAll('-', '\u2011');

  final textPainter = TextPainter(
    text: TextSpan(text: normalizedText, style: style),
    textDirection: TextDirection.ltr,
  );

  // When softWrap is false, lay out without a width constraint so text never wraps.
  final layoutWidth =
      softWrap ? maxWidth - padding.horizontal : double.infinity;
  textPainter.layout(maxWidth: layoutWidth);

  return textPainter.height + padding.vertical;
}

(List<double>, List<double>) computePositions(List<String> dataset, double screenWidth) {

  List<double> itemHeights = [];
  List<double> itemScrollPositions = []; // Holds the starting pixel offset for each index

  double currentOffset = 0.0;
  const TextStyle textStyle = TextStyle(fontSize: 16);
  const EdgeInsets padding = EdgeInsets.all(16);

  for (String text in dataset) {
    double height = calculateTextHeight(text, textStyle, screenWidth, padding);
    itemHeights.add(height);
    itemScrollPositions.add(currentOffset);
    
    currentOffset += height; // The next item starts where this one ends
  }

  return (itemHeights, itemScrollPositions);
}