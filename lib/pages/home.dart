import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gemapp/widgets/listing_item.dart';




class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding( // TODO : add profile icon and name as such. Greeting should be based on time bc its cool.
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical:10),
            child: Text('Hello Swathi, Good Morning!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            child: Column(
              children: [
                ListTile(
                  title: Text('Total Sold'),
                  subtitle: Text('Rs. 255000'),
                  trailing: Icon(Icons.analytics,color: Color.fromRGBO(75, 165, 221, 1)),
                ),
                ListTile(
                  title: Text('Items Sold'),
                  subtitle: Text('230 Items'),
                  trailing: Icon(Icons.shopping_basket,color: Color.fromRGBO(75, 165, 221, 1)),
                ),
                ListTile(
                  title: Text('Transactions'),
                  subtitle: Text('85 Transactions'),
                  trailing: Icon(Icons.swap_horiz,color: Color.fromRGBO(75, 165, 221, 1)),
                ),
                ListTile(
                  title: Text('Best Seller'),
                  subtitle: Text('Construction Foam – Loctite Foam Sealant'),
                  trailing: Icon(Icons.thumb_up,color: Color.fromRGBO(75, 165, 221, 1)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Your Listings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 1,
            childAspectRatio: 2.2/1,

            children: List.generate(4, (index) {
              return ListingItem(name:"Product Name", price:"500",currQ:"22",maxQ:"50");
            }),
          ),
        ],
      ),
    );
  }
}