import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gemapp/pages/loading.dart';
import 'package:gemapp/widgets/BigBlackButton.dart';

class FinalReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: bigBlackButton(
        action: () async {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(content:LoadingScreen()),
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
        name: 'Confirm and Upload',
      ),
    );
  }
}