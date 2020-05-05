import 'package:flutter/material.dart';
import 'screens/setup_screen.dart';

void main() => runApp(DontTouch());

class DontTouch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SetupScreen(),
    );
  }
}
