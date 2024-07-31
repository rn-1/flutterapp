import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gemapp/widgets/categorizer.dart';

class CategorySelectionScreen extends StatelessWidget {
  final onCompletion;
  CategorySelectionScreen({required this.onCompletion});

  @override
  Widget build(BuildContext context) {
    return Center(child:Categorizer(onCompletion: onCompletion));
  }
}