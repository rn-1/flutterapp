import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gemapp/services/auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AccountMenu extends StatelessWidget {

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AccountMenu({required this.auth, required this.firestore}): super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(image: AssetImage("image_placeholder/placeholder150.png")),
            Text("Swathi")
          ]
        ),
        TextButton(onPressed: () {}, child: ListTile(title: Text("Edit Profile"))),
        TextButton(onPressed: () {}, child: ListTile(title: Text("Account Settings"))),
        TextButton(onPressed: () {}, child: ListTile(title: Text("Report a Bug"))),
        TextButton(onPressed: () async {await Auth(auth: this.auth).signOut();}, child: ListTile(leading: Icon(Icons.logout),title: Text("Log Out")))
      ],
    );
  }
}