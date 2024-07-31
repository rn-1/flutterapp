// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemapp/pages/home.dart';
import 'package:gemapp/pages/login.dart';
import 'package:gemapp/services/auth.dart';
import 'package:gemapp/pages/menu.dart';
import 'package:gemapp/pages/previewlisting.dart';
import 'package:gemapp/pages/takephoto.dart';
import 'package:gemapp/pages/previewphoto.dart';
import 'package:gemapp/pages/filldetails.dart';
import 'package:gemapp/pages/fillcategory.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GEMApp());
}

class GEMApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget{
  @override

  _AuthState createState() => _AuthState();
}

class _AuthState extends State<AuthPage>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: Auth(auth: _auth).user,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data?.uid == null) {
            return Login(
              auth: _auth,
              firestore: _firestore,
            );
          } else {
            return HomePage(
              auth: _auth,
              firestore: _firestore,
            );
          }
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Loading..."),
            ),
          );
        }
      }
    ); //Auth stream
  }
}

class HomePage extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  HomePage({required this.auth, required this.firestore}) : super();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _pages = [];
  final List<String> titles = ["Home", "Add Item", "Menu"];

  @override
  void initState() {
    super.initState();
    // Initialize _pages here
    _pages = [
      HomeScreen(),
      AddItemProcess(),
      AccountMenu(auth: widget.auth, firestore: widget.firestore) // Access widget properties
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(titles[_currentIndex],textAlign: TextAlign.left,),
        shadowColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromRGBO(75,168,221,1),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

class AddItemProcess extends StatefulWidget {
  @override
  _AddItemProcessState createState() => _AddItemProcessState();
}

class _AddItemProcessState extends State<AddItemProcess> { // TOOD fix this so that it is step based
  int step = 0;
  ImageProvider<Object>? _image;

  void proceedImage(image){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          print("Proceeding with image!");
          _image = image;
          step += 1;
        });
      }
    });
  }
  void proceedNormal(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          print("Proceeding!");
          step += 1;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> step_pages = [
        TakePhotoScreen(onCompletion: proceedImage,),
        PhotoPreviewScreen(onCompletion: proceedImage, image: _image),
        CategorySelectionScreen(onCompletion: proceedNormal,),
        FillDetailsScreen(image: _image),
        FinalReviewScreen(),
    ];

    return  step_pages[step];
  }
}


