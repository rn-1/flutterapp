import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemapp/pages/fillcategory.dart';
import 'package:gemapp/pages/loading.dart';

class PhotoPreviewScreen extends StatefulWidget {
  
  ImageProvider<Object>? image;
  PhotoPreviewScreen({required this.image});

  @override
  _PhotoPreviewState createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreviewScreen>{

  void setImage(image){
    setState(() {
      image = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    print("Moving to preview");
    if(widget.image == null){
      print("Image is null!");
      return LoadingScreen();
    }
    else{
      return Column(
        children:[
          Center(child:Image(image:widget.image as ImageProvider<Object>)),
          SizedBox(height:52),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategorySelectionScreen(image: widget.image))),
                  tooltip: "Continue",backgroundColor: Colors.black, 
                  child: Icon(Icons.check, color: Colors.white),
                  shape: CircleBorder(),
                ),
              ]
            )
          )
        ]
      );
    }
  }
}