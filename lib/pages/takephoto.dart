import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class TakePhotoScreen extends StatefulWidget {
  @override


  _TakePhotoScreenState createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen>{
  int choice = 0;

  @override
  void initState() {
    super.initState();
  }
  // REPLACE TEXT WITH ACTUAL PAGE WHEN TESTING ON PHONE.
  List<Widget> _pages = [useCameraScreen(), uploadImageScreen()];


  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error occurred while picking the image: $e');
    }
  }


  @override
  Widget build(BuildContext context) {

    if(choice == 1){
      return Scaffold(body:_pages[0]);
    }
    if(choice == 2){
      return Scaffold(body:_pages[1]);
    }
    else{
      return Scaffold(
          body:
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState((){choice = 1;}),
              child: Column(
                children:[
                  const ListTile(
                    leading: Icon(Icons.camera_alt,color: Color.fromRGBO(75, 165, 221, 1)),
                    title: Text('Take Photo'),
                  )
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical:10),
              child: Text("or")
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Column(
                children:[
                  const ListTile(
                    leading: Icon(Icons.upload, color: Color.fromRGBO(75, 165, 221, 1)),
                    title: Text('Upload from photos'),
                  )
                ]
              )
            )
          ],
        )
      );
    }
  }
}

class useCameraScreen extends StatefulWidget{ // TODO using the camera library but it sucks tbh
  
  // final CameraController? cameraController = CameraController();

  @override
  _useCameraScreenState createState() => _useCameraScreenState();
  
}

class _useCameraScreenState extends State<useCameraScreen>{
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  Future<void> _initializeCamera() async {
    // Obtain a list of the available cameras on the device.
    print("initializing camera");
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras (the first camera).
    final firstCamera = cameras.first;

    // Create a CameraController with the first camera and a specified resolution.
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    // Initialize the controller.
    _initializeControllerFuture = _controller.initialize();

    // If the widget gets disposed while initializing, dispose the controller.
    if (!mounted) {
      _controller.dispose();
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class uploadImageScreen extends StatefulWidget{

  @override
  _uploadImageState createState() => _uploadImageState();

}

class _uploadImageState extends State<uploadImageScreen>{

  

  @override
  Widget build(BuildContext builder){
    return Scaffold(body: Center(
        child: Column(
          children:[Text("Waiting...")]
        ),
      ),);
  }

}

