import 'package:bmi_starter/consts/app_colors.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.child, this.color = kCardColor});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.white30, width: 2.0),
        borderRadius: BorderRadius.circular(12),
        boxShadow: List.filled(
          1,
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ),
      ),
      child: Padding(padding: const EdgeInsets.all(15.0), child: child),
    );
  }
}
