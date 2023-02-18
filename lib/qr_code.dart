import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class QRCode extends StatefulWidget {
  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  XFile? _image;
  String? _imageUrl;

  // Future _getImage() async {
  //   final ImagePicker _picker = ImagePicker();

  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = image;
  //     _imageUrl = _image.toString();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
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
          Center(
            child: CircleAvatar(
              // radius: 60,
              maxRadius: 80,
              minRadius: 50,
              backgroundImage:
                  _image == null ? null : FileImage(File(_image!.path)),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: _getImage, child: Text('get')),
          // _image == null
          //     ? Container(
          //         width: double.infinity,
          //         height: 200,
          //         child: ElevatedButton(
          //           child: Text('Select Image'),
          //           onPressed: _getImage,
          //         ),
          //       )
          //     : CircleAvatar(
          //         // radius: 60,
          //         maxRadius: 80,
          //         minRadius: 50,
          //         backgroundImage:
          //             _image == null ? null : FileImage(File(_image!.path)),
          //       ),
          // _image == null
          //     ? Container()
          //     : GestureDetector(
          //         onTap: () async {
          //           String url = _imageUrl!;
          //           if (await canLaunchUrl(Uri.parse(url))) {
          //             await launchUrl(Uri.parse(url));
          //           } else {
          //             throw 'Could not launch $url';
          // }
          // },
          // child: Text("Image URL: $_imageUrl")),
        ],
      ),
    );
  }

  void _getImage() async {
    final ImagePicker _picker = ImagePicker();

    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
