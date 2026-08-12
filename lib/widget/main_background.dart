import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  final Widget child;

  const MainBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Color(0xFFF4F3FF),
                  Colors.white,
                ],
              ),
            ),
          ),


          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 280,
              child: CustomPaint(
                painter: WavePainter(),
              ),
            ),
          ),

          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lightPaint = Paint()
      ..color = const Color(0xFF7772CD)
      ..style = PaintingStyle.fill;

    final lightPath = Path();

    lightPath.moveTo(0, 0);
    lightPath.lineTo(size.width * 0.70, 0);

    lightPath.cubicTo(
      size.width * 0.65,
      25,
      size.width * 0.45,
      25,
      size.width * 0.40,
      65,
    );

    lightPath.cubicTo(
      size.width * 0.34,
      110,
      size.width * 0.42,
      140,
      size.width * 0.25,
      145,
    );

    lightPath.cubicTo(
      size.width * 0.05,
      150,
      size.width * 0.08,
      220,
      0,
      230,
    );

    lightPath.close();

    canvas.drawPath(lightPath, lightPaint);

    final darkPaint = Paint()
      ..color = const Color(0xFF4540B8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round;

    final darkPath = Path();

    darkPath.moveTo(size.width * 0.70, 0);

    darkPath.cubicTo(
      size.width * 0.65,
      25,
      size.width * 0.45,
      25,
      size.width * 0.40,
      65,
    );

    darkPath.cubicTo(
      size.width * 0.34,
      110,
      size.width * 0.42,
      140,
      size.width * 0.25,
      145,
    );

    darkPath.cubicTo(
      size.width * 0.05,
      150,
      size.width * 0.08,
      220,
      0,
      230,
    );

    canvas.drawPath(darkPath, darkPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}