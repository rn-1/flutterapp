

import 'package:flutter/material.dart';

class ListingItem extends StatelessWidget{
  final String name; // subject to change depending on backend
  final String price;
  final String currQ;
  final String maxQ;
  ListingItem({required this.name, required this.price, required this.currQ, required this.maxQ});
  @override
  Widget build(BuildContext builder){
    return Card(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image(image: AssetImage("image_placeholder/placeholder150.png")), // Replace with actual image URLs
                Padding(
                  padding: EdgeInsets.symmetric(vertical:9,horizontal:15),
                  child:Row(
                        children: [Text(name)],
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:9,horizontal:15),
                  child:
                  Row(children:[Text('Rs. ${price}'),SizedBox(width: 20,),Text('Qty:${currQ}/${maxQ}')])
                ),
              ],
            ),
          );
  }
}