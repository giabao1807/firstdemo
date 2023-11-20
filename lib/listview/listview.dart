import 'package:firstdemo/listview/sql.helper.dart';
import 'package:flutter/material.dart';

import 'detailpage.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Map<String, dynamic>> _data = [];
  final List<Map<String, dynamic>> _deletedItems = [];

  void _refreshData() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _data = data;
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();

  Future<void> _addItem() async {
    await SQLHelper.createItem(_nameController.text, _imagePathController.text);
    _refreshData();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _nameController.text, _imagePathController.text);
    _refreshData();
  }

  void _deleteItem(int id) async {
    final deletedItem = _data.firstWhere((element) => element['id'] == id);
    await SQLHelper.deleteItem(id);
    _deletedItems.add(deletedItem);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        content: const Text('Successfully Deleted'),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              final lastDeletedItem = _deletedItems.removeLast();
              SQLHelper.createItem(
                  lastDeletedItem['name'], lastDeletedItem['imagePath']);
              _refreshData();
            }),
      ));
    }
    _refreshData();
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingData = _data.firstWhere((element) => element['id'] == id);
      _nameController.text = existingData['name'];
      _imagePathController.text = existingData['imagePath'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                right: 15,
                left: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _imagePathController,
                    decoration: const InputDecoration(hintText: 'Image Path'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Colors.blue.shade900,
                          minimumSize: const Size(80, 40),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Colors.blue.shade900,
                          minimumSize: const Size(80, 40),
                        ),
                        onPressed: () async {
                          if (id == null) {
                            await _addItem();
                          }
                          if (id != null) {
                            await _updateItem(id);
                          }

                          _imagePathController.text = '';
                          _nameController.text = '';
                          
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(id == null ? 'Add' : 'Update'),
                      )
                    ],
                  ),
                ],
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
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
        itemBuilder: (context, index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/${_data[index]["imagePath"]}',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(_data[index]["name"]),
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
                                  imageName: _data[index]["name"],
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
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.indigo,
                      ),
                      onPressed: () => _showForm(_data[index]['id']),
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        onPressed: () => _deleteItem(_data[index]['id'])),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        onPressed: () => _showForm(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
