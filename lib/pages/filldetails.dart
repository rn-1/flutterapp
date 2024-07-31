import 'package:flutter/material.dart';
import 'package:gemapp/widgets/BigBlackButton.dart';
import 'package:gemapp/widgets/text_field.dart';

class FillDetailsScreen extends StatelessWidget {
  List<DropTextField> fields = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
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