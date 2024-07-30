import 'dart:ffi';

import 'package:flutter/material.dart';

class FinalReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: CircularProgressIndicator(),
              title: Text('Processing'),
            ),
          );
          await Future.delayed(Duration(seconds: 2));
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
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
        child: Text('Confirm and Upload'),
      ),
    );
  }
}