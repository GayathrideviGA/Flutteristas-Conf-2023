import 'package:flutter/material.dart';
import 'dart:math';

// Custom widget that extends LeafRenderObjectWidget
class CustomCircularProgressIndicator extends LeafRenderObjectWidget {
  final double value;
  final Color color;
  final double strokeWidth;

  // Constructor for the CustomCircularProgressIndicator widget
  const CustomCircularProgressIndicator({
    super.key,
    required this.value, // The progress value (between 0.0 and 1.0)
    required this.color, // The color of the progress indicator
    required this.strokeWidth, // The width of the indicator's stroke
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    // Create and return a custom render object
    return RenderCustomCircularProgressIndicator(
      value: value,
      color: color,
      strokeWidth: strokeWidth,
    );
  }

  @override
  void updateRenderObject(BuildContext context,
      RenderCustomCircularProgressIndicator renderObject) {
    // Update the properties of the render object
    renderObject
      ..value = value
      ..color = color
      ..strokeWidth = strokeWidth;
  }
}

// Custom render object for rendering the circular progress indicator
class RenderCustomCircularProgressIndicator extends RenderBox {
  double value; // Current progress value
  Color color; // Color of the progress indicator
  double strokeWidth; // Width of the indicator's stroke

  RenderCustomCircularProgressIndicator({
    required this.value,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(PaintingContext context, Offset offset) {
    // Create a Paint object for drawing
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Calculate the center and radius of the circular progress indicator
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2;

    // Define the start angle and sweep angle of the arc
    const startAngle = -pi / 2;
    final sweepAngle = value * 2 * pi;

    // Draw the circular progress indicator using drawArc
    context.canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  void performLayout() {
    // Set the size of the render object to match its constraints
    size = constraints.biggest;
  }
}

// Entry point of the application
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom CircularProgress'),
        ),
        body: const Center(
          child: CustomCircularProgressIndicator(
            value: 0.4,
            color: Colors.blue,
            strokeWidth: 6.0,
          ),
        ),
      ),
    ),
  );
}
