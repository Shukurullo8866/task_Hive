import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_task/data/model/image_model/image_db_model.dart';

class NoInternetImage extends StatefulWidget {
  const NoInternetImage({Key? key}) : super(key: key);
  @override
  State<NoInternetImage> createState() => _NoInternetImageState();
}

class _NoInternetImageState extends State<NoInternetImage> {
  @override
  Widget build(BuildContext context) {
    var images = Hive.box('images');

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("No internet"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: images.values.length,
        itemBuilder: (context, index) {
          List<ImageDbModel> image = images.values.toList().cast();
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(image[index].title),
                  const SizedBox(height: 15),
                  Image(image: NetworkImage(image[index].url), width: 80),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
