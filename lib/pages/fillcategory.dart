import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gemapp/pages/filldetails.dart';
import 'package:gemapp/widgets/categorizer.dart';

class CategorySelectionScreen extends StatelessWidget {

  final ImageProvider<Object>? image;

  CategorySelectionScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(child:Categorizer(onCompletion: (category){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FillDetailsScreen(image: image, category: category,)));
  },),);
  }
}