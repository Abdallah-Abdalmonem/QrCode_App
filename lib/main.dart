import 'package:flutter/material.dart';
import 'package:qr_code/qr_code.dart';
import 'package:qr_code/qr_code_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => QRCodeGenerator(),
        'QRCode': (context) => QRCode(),
      },
      initialRoute: '/',
    );
  }
}
