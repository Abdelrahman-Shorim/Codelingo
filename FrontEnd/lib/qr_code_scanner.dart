import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:quickalert/quickalert.dart';

import 'Screens/home_screen/home_screen.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool _isProcessing = false; // Flag to track processing state

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
                  ? Text(
                      'Barcode Type: ${result!.format}   Data: ${result!.code}')
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
    controller.scannedDataStream.listen((scanData) async {
      if (!_isProcessing && scanData.format == BarcodeFormat.qrcode) {
        setState(() {
          _isProcessing = true;
        });

        try {
          Map<String, dynamic> jsonMap = jsonDecode(scanData.code!);
          debugPrint(
              jsonMap["name"]); // -----> use lecture id to enroll student
          setState(() {
            result = scanData;
          });

          await QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Enrolled to course ${jsonMap["name"]}!',
            onConfirmBtnTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            },
          );
        } catch (e) {
          debugPrint('Error decoding JSON: $e');
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'Failed to enroll to course. Invalid QR code.',
          );
        } finally {
          setState(() {
            _isProcessing = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
