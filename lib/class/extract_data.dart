import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ExtractData {
  final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
  File fileImage;
  bool run = false;

  openImage() async {
    String response = await getImageFile();
    return response;
  }

  getImageFile() async {
    File file = await FilePicker.getFile();
    fileImage = file;
    String text;

    try {
      FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(file);
      VisionText visionText = await textRecognizer.processImage(visionImage);

      text = visionText.text;
      run = true;
    } catch (e) {
      text = 'Sem foto selecionada';
    }

    return text;
  }
}
