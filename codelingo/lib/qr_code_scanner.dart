import 'dart:convert';
import 'package:codelingo/services/CoursesService.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:codelingo/Screens/home_screen/home_screen.dart';
class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String? courseId;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text('Barcode Type: ${result!.format}   Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null) {
          _parseQRCode(result!.code);
        }
      });
    });
  }

  void _parseQRCode(String? code) {
    if (code != null) {
      try {
        print("Code $code['CourseId']");
        final Map<String, dynamic> data = jsonDecode(code);
        if (data.containsKey('CourseId')) {
          courseId = data['CourseId'];
          print("CourseID $courseId");

          _navigateToHomeScreen(courseId!);
        }
      } catch (e) {
        // Handle JSON parsing error
        print('Error parsing JSON: $e');
      }
    }
  }

  Future<void> _navigateToHomeScreen(String? courseId) async {
    CoursesService _courseservice= CoursesService();
    print("Course $courseId");
    await _courseservice.enrollStudentCourse(courseId!);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(courseid: courseId),
      ),
    );
  }}