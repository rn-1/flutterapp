import 'dart:ffi';

import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext builder){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ // TODO --> replace with a gif of some sort.
              Container(width:160, height:160, decoration: BoxDecoration(color:Color.fromARGB(255, 0, 0, 0), shape:BoxShape.circle))
            ],
          ),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Processing...",textAlign: TextAlign.center,),],
          ),
        ], // TODO --> timer
    );
  }
}