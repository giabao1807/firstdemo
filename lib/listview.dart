import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'detailpage.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<MyData> _data = [];

  @override
  void initState() {
    super.initState();
    loadData().then((data) {
      setState(() {
        _data = data;
      });
    });
  }
  void _showAddItemDialog() {
    String newItemName = '';
    String newItemImagePath = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Item Name'),
                onChanged: (value) {
                  newItemName = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Image Path'),
                onChanged: (value) {
                  newItemImagePath = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newItem = MyData(
                  id: _data.length + 1,
                  name: newItemName,
                  imagePath: newItemImagePath,
                );

                setState(() {
                  _data.add(newItem);
                });

                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

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
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/${_data[index].imagePath}',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(_data[index].name),
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
                                    imageName: _data[index].name,
                                  ),
                                ));
                              } else {
                                // Handle the action for other items.
                              }
                            },
                            child: const Text('Detail'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyData {
  final int id;
  final String name;
  final String imagePath;

  MyData({required this.id, required this.name, required this.imagePath});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      id: json['id'],
      name: json['name'],
      imagePath: json['imagePath'],
    );
  }
}

Future<List<MyData>> loadData() async {
  final String jsonString = await rootBundle.loadString("assets/file.json");
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => MyData.fromJson(json)).toList();
}
