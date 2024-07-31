import 'package:flutter/material.dart';

class bigBlackButton extends StatelessWidget{
  final String name;
  final Function action;

  bigBlackButton({required this.name,required this.action});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:24, vertical:20),
      child: Container(
        height: 64, width: 327,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(0, 0, 0, 1)),
          onPressed: () => this.action(),
          child: Text(name, style: TextStyle(color:Colors.white))
        )
      ),
    );
  }
}