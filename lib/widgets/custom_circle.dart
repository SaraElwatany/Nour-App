import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';

class PulsatingCircle extends StatefulWidget {
  @override
  _PulsatingCircleState createState() => _PulsatingCircleState();
}

class _PulsatingCircleState extends State<PulsatingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 16), 
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
Widget build(BuildContext context) {
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      double radius;
      if (_controller.value <= 0.25) {
        radius = 70 + _controller.value * 150; 
      } else if (_controller.value <= 0.5) {
        radius = 110; 
      } else if (_controller.value <= 0.75) {
        radius = 110 - (_controller.value - 0.5) * 150; 
      } else {
        radius = 70; 
      }

      // Calculate the maximum hole size based on the current radius
      double maxHoleSize = radius +40;
      
      // Calculate the current hole size based on the animation progress
      double holeSize = 110 + (_controller.value * maxHoleSize);

      // Adjust hole size if it exceeds the max hole size
      if (holeSize > maxHoleSize) {
        holeSize = maxHoleSize;
      }

      return Container(
        width: radius * 2,
        height: radius * 2,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer Circle
            Container(
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            // Inner Circle (Hole)
            Center(
              child: Container(
                width: holeSize,
                height: holeSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                 gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
                ),
              ),
            ),
            // Text
            Text(
              _getPhaseText(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    },
  );
}


  String _getPhaseText() {
    if (_controller.value <= 0.25) {
      return S.of(context).inhale;
    } else if (_controller.value <= 0.5) {
      return S.of(context).hold;
    } else if (_controller.value <= 0.75) {
      return S.of(context).exhale;
    } else {
      return S.of(context).hold;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
