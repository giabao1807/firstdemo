import 'package:flutter/material.dart';

import '../transform.dart';

class CurvedAnimationScreen extends StatefulWidget {
  const CurvedAnimationScreen({super.key});

  @override
  State<CurvedAnimationScreen> createState() => _CurvedAnimationScreenState();
}

class _CurvedAnimationScreenState extends State<CurvedAnimationScreen>
    with SingleTickerProviderStateMixin {
  String title = 'Slide Transittion';

  late AnimationController _controller;
  late Animation<Offset> offsetAnimaton;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    offsetAnimaton = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: Text('Curved Animation Screen'),
          ),
        ),
        body: Center(
          child: SlideTransition(
            position: offsetAnimaton,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/2.jpg',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Hero Animation Screen'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  
                },
                child: Hero(
                    tag: 'imageHero',
                    child: Image.asset('assets/images/4.jpg'))),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TransformScreen()));
                },
                child: const Text('Transform Button')),
          ],
        ),
      ),
    );
  }
}