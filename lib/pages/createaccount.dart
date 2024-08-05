import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gemapp/services/auth.dart';

class CreateAccount extends StatefulWidget{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const CreateAccount({
    required this.auth,
    required this.firestore,
  }) : super();
  @override
  _CreateAccState createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAccount>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}