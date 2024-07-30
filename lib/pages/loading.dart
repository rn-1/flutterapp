import 'dart:ffi';

import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext builder){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [ // TODO --> replace with a gif of some sort.
              Container(width:300, height:300, decoration: BoxDecoration(color:Color.fromARGB(255, 0, 0, 0), shape:BoxShape.circle))
            ],
          ),
          SizedBox(height:20),
          Row(
            children: [Text("Processing")],
          ),
        ], // TODO --> timer
      )
    );
  }
}