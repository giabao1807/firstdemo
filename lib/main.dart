import 'package:firstdemo/MVVM/src/view/user_view.dart';
import 'package:firstdemo/mvc_pattern.dart';
import 'package:firstdemo/mvp_pttern.dart';


import 'package:flutter/material.dart';
import 'newpage.dart';
import 'expansion.dart';
import 'hero.dart';
import 'videoapp.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ],
          backgroundColor: Colors.blue,
          title: const Align(
            alignment: Alignment.center,
            child: Text('Home Page'),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/flutter1.jpg',
                  fit: BoxFit.cover,
                  width: 450,
                  height: 250,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'First Demo',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                AnimatedBuilder(
                  animation: _iconAnimationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _iconAnimationController.value * 2 * 3.141592,
                      child: const FlutterLogo(
                        size: 100.0,
                      ),
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.blue.shade900,
                            ),
                            child: const Text(
                              'Button 1',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewPage(),
                                ),
                              );
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.blue.shade900,
                            ),
                            child: const Text(
                              'Button 2',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ExpansionScreen(),
                                ),
                              );
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.blue.shade900,
                            ),
                            child: const Text(
                              'Button 3',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HeroScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.blue.shade900,
                            ),
                            child: const Text(
                              'Button 4',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VideoApp(),
                                ),
                              );
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.blue.shade900,
                            ),
                            child: const Text(
                              'Button 5',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MVCScreen(),
                                ),
                              );
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.blue.shade900,
                            ),
                            child: const Text(
                              'Button 6',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MVPScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.blue.shade900,
                            ),
                            child: const Text(
                              'Button 7',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MVVMScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
