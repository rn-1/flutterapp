import 'package:flutter/material.dart';
import 'package:gemapp/widgets/BigBlackButton.dart';
import 'package:gemapp/widgets/text_field.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
class FillDetailsScreen extends StatelessWidget {
  List<DropTextField> fields = [];
  final ImageProvider<Object>? image;
  
  FillDetailsScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StickyContainer(stickyChildren: [],child:Container(width:327,height:310, child:Image(image: image as ImageProvider<Object>))),
            SizedBox(height:20),
            DropTextField(name:"Description"),
            SizedBox(height: 16),
            DropTextField(name:"Color"),
            SizedBox(height: 16),
            DropTextField(name:"Size"),
            SizedBox(height: 16),
            DropTextField(name:"Packaging"),
            SizedBox(height: 30),
            bigBlackButton(name: "Confirm", action: () => print("confirmed!")),
          ],
        ),
      ),
    );
  }
}