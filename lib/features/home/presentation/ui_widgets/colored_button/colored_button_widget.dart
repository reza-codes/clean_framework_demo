import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColoredButtonWidget extends StatefulWidget {
  const ColoredButtonWidget({super.key});

  @override
  State<ColoredButtonWidget> createState() => _ColoredButtonWidgetState();
}

class _ColoredButtonWidgetState extends State<ColoredButtonWidget> {
  @override
  Widget build(BuildContext context) {
    print("Built from colored button widget");
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      ),
      onPressed: () => setState(() {}),
      child: const Text('Change my Color!'),
    );
  }
}
