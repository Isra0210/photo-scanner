import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final fileImage;

  ImageView(this.fileImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagem'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: EdgeInsets.zero,
          width: double.infinity,
          color: Colors.black,
          child: Image.file(fileImage),
        ),
      ),
    );
  }
}
