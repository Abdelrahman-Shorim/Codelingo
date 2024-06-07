import 'package:codelingo/qr_generator/qr.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String jsonSample = '''
    {
      "name": "Lecture 2",
      "topic": "if",
      "_link": "wwwS.link_here.comS"
    }
    ''';

    QrImageView qrImage = generateQrImageFromJson(jsonSample);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Code Generator'),
        ),
        body: Center(
          child: qrImage,
        ),
      ),
    );
  }
}
