import 'dart:math';

import 'package:flutter/material.dart';


class TransformScreen extends StatefulWidget {
  const TransformScreen({super.key});

  @override
  State<TransformScreen> createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Transform and Opacity Animation Screen'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GestureDetector(
            onTap: _changeOpacity,
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 3),
              child: Transform.rotate(
                angle: pi / 4,
                child: Image.asset('assets/images/2.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}