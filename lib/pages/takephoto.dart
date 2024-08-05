import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gemapp/pages/fillcategory.dart';
import 'package:gemapp/pages/loading.dart';
import 'package:gemapp/pages/previewphoto.dart';
import 'package:gemapp/widgets/BigBlackButton.dart';
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
  // List<Widget> _pages = [useCameraScreen(), uploadImageScreen()];


  // ImageProvider<Object>? _image;
  // final ImagePicker _picker = ImagePicker();

  // Future<void> _pickImage(ImageSource source) async {
  //   try {
  //     final pickedFile = await _picker.pickImage(source: source);

  //     if (pickedFile != null) {
  //       setState(() {
  //         _image = AssetImage(pickedFile.path);
  //       });
  //     }
  //   } catch (e) {
  //     print('Error occurred while picking the image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
          onGenerateRoute: (settings){
            Widget page = SelectScreen();
            return MaterialPageRoute(builder: (_) => page);
          },
        )
    );
  }
}


class SelectScreen extends StatefulWidget{
  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen>{

  ImageProvider<Object>? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _image = AssetImage(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error occurred while picking the image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => useCameraScreen()));},
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
            onPressed: ()async { await _pickImage(ImageSource.gallery); Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoPreviewScreen(image:_image)));},
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
      );
  }
}

class useCameraScreen extends StatefulWidget{ // TODO using the camera library but it sucks tbh
  
  // final CameraController? cameraController = CameraController();
  @override
  _useCameraScreenState createState() => _useCameraScreenState();
  
}

class _useCameraScreenState extends State<useCameraScreen>{
  late CameraController? _controller = null;
  late Future<void>? _initializeControllerFuture = null;

  Future<void> _initializeCamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Check if cameras list is not empty
    if (cameras.isNotEmpty) {
      final firstCamera = cameras.first;

      // Create a CameraController with the first camera and a specified resolution.
      _controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );

      // Initialize the controller and store the Future for use in the FutureBuilder.
      _initializeControllerFuture = _controller?.initialize();

      // Ensure the widget is still mounted before calling setState.
      if (mounted) {
        setState(() {});
      }
    } else {
      print('No cameras found on this device.');
    }
  }

  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    super.dispose();
    _controller?.dispose();
  }


// How the fuck do I go back a page????
  @override // TODO: use _controller.takePicture() to actually take the picture.
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller as CameraController);
          }
          else if(_controller == null){
            return AlertDialog(
              icon: Icon(Icons.warning),
              title: Text("No cameras found."),
              actions:[
                bigBlackButton(name: "OK", action: () => Navigator.pop(context))
              ]
            );
          }
          else {
            // Otherwise, display a loading indicator.
            return LoadingScreen();
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

