import 'package:firstdemo/MVP/src/contracts/image_contract.dart';
import 'package:firstdemo/MVP/src/presenter/image_presenter.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> implements ImageContract {
  late ImagePresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = ImagePresenter(this);
    _presenter.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _presenter.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _presenter.items.length,
              itemBuilder: (context, index) {
                final item = _presenter.items[index];
                return Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/${item.imagePath}',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ));
              },
            ),
    );
  }

  @override
  void onItemsLoaded() {
    setState(() {});
  }
}
