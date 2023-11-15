import 'package:flutter/material.dart';

import 'db_helper.dart';
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
    _loadDataFromDatabase();
  }

  Future<void> _loadDataFromDatabase() async {
    List<MyData> data = await DBHelper.instance.getData();
    setState(() {
      _data = data;
    });
  }

  void _showAddItemDialog() {
    String newItemName = '';
    String newItemImagePath = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Image'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
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
              onPressed: () async {
                final newItem = MyData(
                  name: newItemName,
                  imagePath: newItemImagePath,
                );

                int id = await DBHelper.instance.insertData(newItem);

                setState(() {
                  newItem.id = id;
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
                              } else {}
                            },
                            child: const Text('Detail'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 70.0),
                    child: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _data.removeAt(index);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        onPressed: () {
          _showAddItemDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyData {
  int? id;
  final String name;
  final String imagePath;

  MyData({this.id, required this.name, required this.imagePath});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
    };
  }

  factory MyData.fromMap(Map<String, dynamic> map) {
    return MyData(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
    );
  }
}
