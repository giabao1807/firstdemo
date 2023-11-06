import 'package:flutter/material.dart';
import 'detailscreen.dart';


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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DetailScreen(imageName: customImageNames[index]),
        ),
      );
    } else {}
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
                        _handleImageTap(index);
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