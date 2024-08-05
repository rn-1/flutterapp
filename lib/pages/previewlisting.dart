import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gemapp/pages/loading.dart';
import 'package:gemapp/widgets/BigBlackButton.dart';

class FinalReviewScreen extends StatelessWidget {
  final category;
  final details;
  final image;

  FinalReviewScreen({this.category, this.details, this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:[
          SingleChildScrollView(
            child: Column(children: [Image(image: image,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: details.length,
                itemBuilder: (BuildContext context, int index){
                  return Text("${details.keys.toList()[index]}: ${details[details.keys.toList()[index]]}");
                }),
              Text("Category: ${category}")
            ],
            )
          ),
          bigBlackButton(
            action: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(content:LoadingScreen()),
              );
              await Future.delayed(Duration(seconds: 2));
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: Text('Successfully made listing.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            name: 'Confirm and Upload',
          ),
    ]));
  }
}