import 'package:flutter/material.dart';

class StatIndicator extends StatelessWidget {
  final double value;

  const StatIndicator({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Color setColor = value <= .5 ? Colors.red : Colors.green;

    return LinearProgressIndicator(
      value: value,
      valueColor: AlwaysStoppedAnimation<Color>(setColor),
      backgroundColor: Colors.grey[300],
    );
  }
}
