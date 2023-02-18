import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatefulWidget {
  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  String? _inputUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, 'QRCode');
              },
              icon: const Icon(Icons.camera_alt))
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'QR Code',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Enter URL'),
              onChanged: (value) {
                setState(() {
                  _inputUrl = value;
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: _inputUrl == null
                  ? const Text('No URL entered')
                  : QrImage(
                      data: _inputUrl!,
                      size: 300,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
