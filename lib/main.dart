// import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

//import 'package:video_player/video_player.dart';

List<String> imageList = [
  '2.jpg',
  '3.jpg',
  '4.jpg',
  '5.jpg',
  '6.jpg',
  '7.jpg',
  '8.jpg',
  '9.jpg',
  '10.png'
];
void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
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
                margin: const EdgeInsets.only(top: 150.0),
                child: Row(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/2.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Video Screen'),
        ),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: Text('New Screen'),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/1.svg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 30),
                const Text(
                  'This is a SVG Picture',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text('Counter: $counter',
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                      key: ValueKey(counter)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.blue.shade900,
                      ),
                      onPressed: () {
                        setState(() {
                          counter--;
                        });
                      },
                      child: const Text('Decrement'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.blue.shade900,
                      ),
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      child: const Text('Increment'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpansionScreen extends StatefulWidget {
  const ExpansionScreen({super.key});

  @override
  State<ExpansionScreen> createState() => _ExpansionScreenState();
}

class _ExpansionScreenState extends State<ExpansionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Expansion Screen'),
        ),
      ),
      body: ExpansionTile(
        title: const Text('Screens'),
        children: [
          ListTile(
            textColor: Colors.red,
            title: const Text('Grid View'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const GridViewScreen(),
              ));
            },
          ),
          ListTile(
            textColor: Colors.orange,
            title: const Text('List View'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListViewScreen(),
              ));
            },
          ),
          ListTile(
            textColor: Colors.green,
            title: const Text('Curved Animation '),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CurvedAnimationScreen(),
              ));
            },
          ),
        ],
      ),
    );
  }
}

// class GridViewScreen extends StatelessWidget {
//   const GridViewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(brightness: Brightness.dark),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: const Align(
//             alignment: Alignment.center,
//             child: Text('Grid View Screen'),
//           ),
//         ),
//         body: GridView.builder(
//           itemCount: imageList.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//           ),
//           itemBuilder: ( context, index){
//             return Column(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),

//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<String> imageList = [
    '2.jpg',
    '3.jpg',
    '4.jpg',
    '5.jpg',
    '6.jpg',
    '7.jpg',
    '8.jpg',
    '9.jpg',
    '10.png'
  ];

  List<String> customImageNames = [
    'Con thỏ1',
    'Con mèo1',
    'Con cáo',
    'Con gấu',
    'Con mèo 2',
    'Con thỏ 2',
    'Con mèo 3',
    'Con khủng long',
    'Con panda'
  ];

  void _handleImageTap(int index) {
    if (index == 0) {
      // Navigate to the new screen when the button in the first item is pressed
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DetailScreen(imageName: customImageNames[index]),
        ),
      );
    } else {
      // Handle other button presses (if needed)
    }

    // Xử lý sự kiện khi hình ảnh được nhấn
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.dark),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Align(
            alignment: Alignment.center,
            child: Text('Grid View Screen'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 300),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/${imageList[index]}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      customImageNames[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.blue.shade900,
                      ),
                      onPressed: () {
                        _handleImageTap(
                            index); // Xử lý sự kiện khi nút được nhấn
                      },
                      child: const Text('Detail'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imageName;

  const DetailScreen({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imageName),
            // Add other content for your detail screen
          ],
        ),
      ),
    );
  }
}

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> imageList = [
    '2.jpg',
    '3.jpg',
    '4.jpg',
    '5.jpg',
    '6.jpg',
    '7.jpg',
    '8.jpg',
    '9.jpg',
    '10.png'
  ];

  List<String> customImageNames = [
    'Con thỏ1',
    'Con mèo1',
    'Con cáo',
    'Con gấu',
    'Con mèo 2',
    'Con thỏ 2',
    'Con mèo 3',
    'Con khủng long',
    'Con panda'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Align(
          alignment: Alignment.center,
          child: Text('List View Screen'),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/${imageList[index]}',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(customImageNames[index]),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Colors.blue.shade900,
                          ),
                          onPressed: () {
                            if (index == 0) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    imageName: customImageNames[index]),
                              ));
                            } else {
                              // Handle other items' button presses here
                            }
                          },
                          child: const Text('Detail'))
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String imageName;

  const DetailPage({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imageName),
            // Add other content for your detail screen
          ],
        ),
      ),
    );
  }
}

// class ListViewScreen extends StatelessWidget {
//   const ListViewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Align(
//           alignment: Alignment.center,
//           child: Text('List View Screen'),
//         ),
//       ),
//       body: ListView(
//         scrollDirection: Axis.vertical,
//         addAutomaticKeepAlives: false,
//         children: <Widget>[
//           Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
//           Image.asset('assets/images/3.jpg', fit: BoxFit.cover),
//           Image.asset('assets/images/4.jpg', fit: BoxFit.cover),
//           Image.asset('assets/images/5.jpg', fit: BoxFit.cover),
//           Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
//           Image.asset('assets/images/7.jpg', fit: BoxFit.cover),
//           Image.asset('assets/images/8.jpg', fit: BoxFit.cover),
//           Image.asset('assets/images/9.jpg', fit: BoxFit.cover),
//           Image.asset('assets/images/10.png', fit: BoxFit.cover),
//         ],
//       ),
//     );
//   }
// }

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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LocalizationScreen()));
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

class LocalizationScreen extends StatefulWidget {
  const LocalizationScreen({super.key});

  @override
  State<LocalizationScreen> createState() => _LocalizationScreenState();
}

class _LocalizationScreenState extends State<LocalizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('LocalizationScreen'),
        ),
      ),
    );
  }
}

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
