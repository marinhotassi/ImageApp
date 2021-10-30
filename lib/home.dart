import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    Future takePhoto() async {
      // ignore: deprecated_member_use
      final PickedFile = await picker.getImage(source: ImageSource.camera);
      setState(() {
        _image = File(PickedFile!.path);
      });
    }

    Future getImage() async {
      // ignore: deprecated_member_use
      final PickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(PickedFile!.path);
      });
    }

    Future<void> _dialogbox() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(),
              content: SingleChildScrollView(
                  child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      "picture from camera",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    onTap: takePhoto,
                  ),
                  GestureDetector(
                    child: Text(
                      "picture from gallery",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    onTap: getImage,
                  ),
                ],
              )),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App',
        ),
      ),
      body: Center(
        child: _image == null ? Text('no image') : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_a_photo),
        tooltip: 'open camera',
      ),
    );
  }
}
