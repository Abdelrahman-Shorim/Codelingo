import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

QrImageView generateQrImageFromJson(String jsonInput,
    {double qrSize = 320, Size imgSize = const Size(45, 45)}) {
  AssetImage embeddedImage = _getRandomImage();

  return QrImageView(
    data: jsonInput,
    version: QrVersions.auto,
    size: qrSize,
    gapless: false,
    embeddedImage: embeddedImage,
    embeddedImageStyle: QrEmbeddedImageStyle(
      size: imgSize,
    ),
  );
}

AssetImage _getRandomImage() {
  List<String> imagePaths = [
    'assets/images/duo-1.png',
    'assets/images/duo-2.png',
    'assets/images/duo-3.png',
  ];
  int randomIndex = Random().nextInt(imagePaths.length);
  return AssetImage(imagePaths[randomIndex]);
}



class QrCodeGen extends StatelessWidget {
  final String courseid;
  const QrCodeGen({super.key,required this.courseid});

  @override
  Widget build(BuildContext context) {
    String jsonSample = '''
    {
     "CourseId": "$courseid"
    }
    ''';

    QrImageView qrImage = generateQrImageFromJson(jsonSample);

    return Center(
      
      
         
       
            child: qrImage,
        
      
      
    );
  }
}

// String jsonSample = '''
// {
//   "name": "Lecture 2",
//   "topic": "loops",
//   "email": "test@example.com",
//   "_link": "wwwS.link_here.comS"
// }
// ''';

//QrImageView qrImage = generateQrImageFromJson(jsonSample);
