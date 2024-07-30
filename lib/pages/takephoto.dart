import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class TakePhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed:(){},
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
          onPressed: (){},
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

class useCameraScreen extends StatelessWidget{ // TODO using the camera library but it sucks tbh
  
  // final CameraController? cameraController = CameraController();

  // @override
  // void initState() async {
  //   await availableCameras().then(
  //     (value) => Navigator.push(
  //     context, MaterialPageRoute(
  //     builder: (_) => CameraPage(cameras: value))
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext builder){
    return Column(
      children:[
        // CameraPreview(cameraController!,)
        Text("Work in progress!");
      ]
    );
  }
}

class uploadImageScreen extends StatelessWidget{

  @override
  Widget build(){

  }
}


