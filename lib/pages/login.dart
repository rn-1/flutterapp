import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gemapp/services/auth.dart';




class Login extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const Login({
    required this.auth,
    required this.firestore,
  }) : super();
  @override
  _LoginState createState() => _LoginState();
}

// TODO create account
class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sign In', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                
              ),
              controller:_usernameController
            ),
            SizedBox(height:10),
            Text("or",textAlign: TextAlign.center),
            SizedBox(height:10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone No.',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              controller:_phoneNoController
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              controller:_passwordController
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final String retVal;
                if(_usernameController.text == ""){
                  print("Using phone no. as no email given");
                  retVal = await Auth(auth: widget.auth).signIn(
                      email: _phoneNoController.text,
                      password: _passwordController.text,
                    ) as String;
                }
                else{
                  print("Using email as no phone no. given");
                  retVal = await Auth(auth:widget.auth).signIn(
                    email: _usernameController.text,
                    password: _passwordController.text
                  ) as String;
                }
                if (retVal == "Success") {
                      _usernameController.clear();
                      _phoneNoController.clear();
                      _passwordController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(retVal + " " + _usernameController.text),
                        ),
                    );
                }
              },
              child: Text('Login', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}