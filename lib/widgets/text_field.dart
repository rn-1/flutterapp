
import 'package:flutter/material.dart';

class DropTextField extends StatelessWidget{
  final TextEditingController controller = TextEditingController();
  final String name;

  DropTextField({required this.name});
  @override
  Widget build(BuildContext builder){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:24,vertical:10), 
      child: ExpansionTile(
        children:[TextFormField(controller: controller, decoration: InputDecoration(border: OutlineInputBorder()),)],
        title: Text(name),
        backgroundColor: Color.fromARGB(255, 217, 217, 217),
      )
    );
  }
}