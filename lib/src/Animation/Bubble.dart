import 'dart:math';
import 'package:flutter/material.dart';

class Bubble {
  late double x;
  late double y;
  double radius;
  Color color;
  late double speedY;
  late double speedX;

  Bubble(this.x, this.y, this.radius, this.color) {
    final random = Random();
    speedY = random.nextDouble() * 2 + 1;
    speedX = random.nextDouble() * 2 - 1;
  }

  void move(Size size) {
    y -= speedY;
    x += speedX;
    if (y + radius < 0) {
      y = size.height + radius;
    }
    if (x - radius > size.width || x + radius < 0) {
      x = Random().nextDouble() * size.width;
    }
  }
}

class BubblesController extends StatefulWidget {
  const BubblesController({super.key});

  @override
  _BubblesControllerState createState() => _BubblesControllerState();
}

class _BubblesControllerState extends State<BubblesController>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Bubble> bubbles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100))
      ..repeat();
    bubbles = List.generate(20, (index) {
      final random = Random();
      return Bubble(
        random.nextDouble() * 400,
        random.nextDouble() * 800,
        random.nextDouble() * 20 + 10,
        Colors.primaries[random.nextInt(Colors.primaries.length)],
      );
    });

    _controller.addListener(() {
      for (var bubble in bubbles) {
        bubble.move(MediaQuery.of(context).size);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: BubblePainter(bubbles),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;

  BubblePainter(this.bubbles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (var bubble in bubbles) {
      paint.color = bubble.color.withOpacity(0.9);
      canvas.drawCircle(Offset(bubble.x, bubble.y), bubble.radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

void main() {
  runApp(const MaterialApp(home: BubblesController()));
}