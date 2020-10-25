import 'package:flutter/material.dart';
import 'package:flutter_app2/class/extract_data.dart';
import 'package:flutter_app2/view/image.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final dataImage = ExtractData();
  String text = 'Selecione uma foto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text('Foto Scanner'),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.restore),
            onPressed: () {
              setState(() {
                text = 'Selecione uma foto';
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageView(dataImage.fileImage)),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(bottom: 100.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        child: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 40.0,
          ),
        ),
        onTap: () async {
          String imageLabels = await dataImage.getImageFile();
          setState(() {
            text = imageLabels;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
